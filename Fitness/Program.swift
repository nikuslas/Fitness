//
//  Program.swift
//  Fitness
//
//  Created by Nicolas Markus on 02/12/2015.
//  Copyright © 2015 Nicolas Markus. All rights reserved.
//

import Foundation
import UIKit

//Creation of Program's class

class Program: NSObject {
    var nameProg: String
    
    init(nameProg: String) {
        self.nameProg = nameProg
        super.init()
    }
}

