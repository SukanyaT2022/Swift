//
//  ViewController.swift
//  practice3switchIMGbox
//
//  Created by Tiparpron Sukanya on 2/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var greenSwitch: UISwitch!
    
    @IBOutlet weak var myImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func greenSwitchControl(_ sender: UISwitch) {
        if sender.isOn{
            myImage.isHidden = false
        }else{
            
            myImage.isHidden = true
            
        }
        
        
    }
    
    
}

