//
//  MyCellOne.swift
//  apr4-practice-emp
//
//  Created by Tiparpron Sukanya on 4/24/23.
//

import Foundation
import UIKit

class MyCellOne: UITableViewCell{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var deptLabel: UILabel!
    // this var vehicle will hole data in each employees --step 1 hold the data
    var vehicles: [String]? // why? some empolyee may have no vehicel so it can be nil so use ?
}
