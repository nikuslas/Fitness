//
//  ProgramTableViewController.swift
//  Fitness
//
//  Created by Nicolas Markus on 02/12/2015.
//  Copyright © 2015 Nicolas Markus. All rights reserved.
//

import UIKit

class ProgramTableViewController: UITableViewController {
    
    var programs: [Program] = ProgramsData
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return programs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ProgramCell", forIndexPath: indexPath)  as! ProgramCell
        let prog = programs[indexPath.row] as Program
       
        cell.nameLabel.text = prog.nameProg

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            // Delete the row from the data source
            programs.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "EditProgram" {
            let navigationController = segue.destinationViewController
                as! UINavigationController
            let programDetailTableViewController =
            navigationController.viewControllers[0]
                as! ProgramDetailTableViewController
            
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPathForCell(cell)
            let selectedProgramIndex = indexPath?.row
            
            if let index = selectedProgramIndex {
                let prog = programs[index]
                programDetailTableViewController.programToEdit = prog
            }
        }

    }

    
    @IBAction func cancelToProgramTableViewController(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func saveProgramDetail(segue:UIStoryboardSegue) {
        let programDetailTableViewController = segue.sourceViewController as!
        ProgramDetailTableViewController
        
        if let programToEdit = programDetailTableViewController.programToEdit {
        
            let programToEditIndex = programs.indexOf(programToEdit)!
            
            let indexPath = NSIndexPath(forRow: programToEditIndex, inSection: 0)
            
            // reload that individual row
            tableView.reloadRowsAtIndexPaths([indexPath],
                withRowAnimation: .Automatic)
        }
        else {
            //add the new coffee to the coffees array
            programs.append(programDetailTableViewController.program)
            
            //update the tableView
            let indexPath = NSIndexPath(forRow: programs.count-1, inSection: 0)
            tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }

        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
        
    }

}
