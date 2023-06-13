//
//  ViewController.swift
//  practice3-button
//
//  Created by Tiparpron Sukanya on 2/9/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var RedButton: UIButton!
    
    
    
    @IBOutlet weak var greenButton: UIButton!
    
    
    
    @IBOutlet weak var colorLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func redButtonAction(_ sender:UIButton) {
        colorLabel.textColor = UIColor.red
    }
    

    @IBAction func greenButtonAction(_ sender: UIButton) {
        colorLabel.textColor = UIColor.green    }
    
}

