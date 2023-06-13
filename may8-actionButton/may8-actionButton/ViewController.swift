//
//  ViewController.swift
//  may8-actionButton
//
//  Created by Tiparpron Sukanya on 5/8/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myButton(_ sender: Any) {
    displayAlert()
    }
    func displayAlert (){
        let alertController = UIAlertController(title: "Warning Spam", message: "Beware of Sapm", preferredStyle:.alert)
        let okAction = UIAlertAction(title:"OK", style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
            
        
    }
    
        
        
    
}

