//
//  Exercice.swift
//  Fitness
//
//  Created by Nicolas Markus on 02/12/2015.
//  Copyright © 2015 Nicolas Markus. All rights reserved.
//

import Foundation
import UIKit

//Creation of Program's class

class Exercice: NSObject {
    var nameExe: String
    
    init(nameExe: String) {
        self.nameExe = nameExe
        super.init()
    }
}
