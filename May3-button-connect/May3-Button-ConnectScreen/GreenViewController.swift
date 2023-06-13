//
//  GreenViewController.swift
//  May3-Button-ConnectScreen
//
//  Created by Tiparpron Sukanya on 5/3/23.
//

import Foundation
import UIKit
class GreenViewController: UIViewController{
    
    @IBOutlet weak var myLabelGreen: UILabel!
    var displayName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myLabelGreen.text = displayName
    }
}
