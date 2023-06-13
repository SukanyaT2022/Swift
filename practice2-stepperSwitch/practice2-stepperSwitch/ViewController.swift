//
//  ViewController.swift
//  practice2-stepperSwitch
//
//  Created by Tiparpron Sukanya on 2/3/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var greenSwitch: UISwitch!
    
    @IBOutlet weak var viewBox: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    
    }

    //sender is  --UIswitch is the type
    @IBAction func greenAction(_ sender: UISwitch) {
        if sender.isOn{
            //link to var name line 15
            viewBox.backgroundColor = UIColor.green
        }else{
            viewBox.backgroundColor = UIColor.red
            
        }
    }
    
    
}

