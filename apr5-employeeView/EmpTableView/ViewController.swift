//
//  ViewController.swift
//  EmpTableView
//
//  Created by 2053384 on 04/04/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var empTableView: UITableView!
    
    
//    let employeeNames = ["Jack", "Ket", "Joe", "Harry", "King"]
    
    let employees = [["name": "Jack", "dept": "A", "vehicles": ["Car", "Cycle", "scooter"]],
                     ["name": "Ket", "dept": "B", "vehicles": ["Car"]],
                     ["name": "Joe", "dept": "C", "vehicles": ["Car", "Cycle"]],
                     ["name": "Harry", "dept": "D", "vehicles": ["Cycle", "scooter"]],
                     ["name": "King", "dept": "E", "vehicles": ["Car", "scooter"]] //Employee Dictionary
                    ]// Array of employees
    
    
    let empjack: [String: Any] = ["name": "Jack",
                                  "dept": "A",
                                  "vehicles": [["Type": "Car", "number": "XYZ"], // Dictionary of Vehicle detail
                                               ["Type": "Cycle", "number": ""],
                                               ["Type":"scooter", "number": "PQR"]
                                              ] // Array of Vehicle
                                ]// Dictionary - Employee data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        empTableView.delegate = self
        empTableView.dataSource = self
    }
    
    
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return employeeNames.count
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "empCell", for: indexPath) as? EmployeeTableViewCell
//        let employeeName = employeeNames[indexPath.row]
//        cell?.nameLabel.text = employeeName
        
        /*
         let employees = [["name": "Jack", "dept": "A"],
                             ["name": "Ket", "dept": "B"],
                             ["name": "Joe", "dept": "C"],
                             ["name": "Harry", "dept": "D"],
                             ["name": "King", "dept": "E"]]
         */
        let employeeDict = employees[indexPath.row] // => Row = 0 --> ["name": "Jack", "dept": "A"]
        let name = employeeDict["name"]!
        let dept = employeeDict["dept"]!
        cell?.nameLabel.text = "Name: \(name)"
        cell?.deptLabel.text = "Dept: \(dept)"
        return cell!
    }
    
    
}
