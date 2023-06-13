//
//  ViewController.swift
//  May7-practice-actionButton
//
//  Created by Tiparpron Sukanya on 5/8/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    //this line get call when press the botton
    @IBAction func myButton(_ sender: Any) {
//        dispalyAlert()
        displayActionsheet()//we call only actionsheet so line 29 to 39 work
    }
    func dispalyAlert(){
        let alertController = UIAlertController(title: "Warning Message", message:"Be careful of spam", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
        
    }
    func displayActionsheet(){
        let alertController = UIAlertController(title: "Choose one option", message: "install a new software", preferredStyle: .actionSheet)
        //below is action lines
        let localAction = UIAlertAction(title: "local", style: .default)
        alertController.addAction(localAction)
        
        //another option
        let globalAction = UIAlertAction(title: "global", style: .default)
        alertController.addAction(globalAction)
        
        self.present(alertController, animated: true)
        
    }
    
}
