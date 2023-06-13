//
//  ViewController.swift
//  may30-json
//
//  Created by Tiparpron Sukanya on 5/30/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkHelper().getEmp()
    }


}

