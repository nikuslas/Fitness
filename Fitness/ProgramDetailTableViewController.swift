//
//  ProgramDetailTableViewController.swift
//  Fitness
//
//  Created by Nicolas Markus on 02/12/2015.
//  Copyright © 2015 Nicolas Markus. All rights reserved.
//

import UIKit

class ProgramDetailTableViewController: UITableViewController {

    required init(coder aDecoder: NSCoder) {
        print("init ProgramDetailTableViewController")
        super.init(coder: aDecoder)!
    }
    
    @IBOutlet weak var nameProgram: UITextField!
    
    var program:Program!
    var programToEdit:Program?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(programToEdit != nil){
            self.title = "Edit Program"
            nameProgram.text = programToEdit!.nameProg
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView,
        didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        if indexPath.section == 0 {
            nameProgram.becomeFirstResponder()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveProgramDetail" {
            if (self.programToEdit != nil){
                self.programToEdit?.nameProg = self.nameProgram.text!
            }
            else{
                program = Program(nameProg: self.nameProgram.text!)
            }
        }
        
    }
    
    deinit {
        print("deinit ProgramDetailTableViewController")
    }
}
