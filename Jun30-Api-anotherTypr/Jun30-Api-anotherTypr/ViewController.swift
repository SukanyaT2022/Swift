//
//  ViewController.swift
//  Jun30-Api-anotherTypr
//
//  Created by Tiparpron Sukanya on 6/30/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NetworkHelper().getMovie()
    }


}

