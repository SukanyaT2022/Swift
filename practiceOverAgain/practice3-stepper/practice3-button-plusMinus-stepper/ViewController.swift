//
//  ViewController.swift
//  practice3-button-plusMinus-stepper
//
//  Created by Tiparpron Sukanya on 2/8/23.
//

import UIKit

class ViewController: UIViewController {
    
 

    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
    }
   


    @IBAction func stepperAction(_ sender: UIStepper) {
        numberLabel.text = String(sender.value)
    }
    
    

}

