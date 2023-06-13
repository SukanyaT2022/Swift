//
//  ViewController.swift
//  EmployeeProj
//
//  Created by 2053384 on 26/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        readJson()
        NetworkHelper().getEmpployees()
    }

    func readJson() {
        if let path = Bundle.main.url(forResource: "Employee", withExtension: "json") {
            let data = try? Data(contentsOf: path)
            let json = try? JSONSerialization.jsonObject(with: data!)
            print(json)
        }
        
    }

}

