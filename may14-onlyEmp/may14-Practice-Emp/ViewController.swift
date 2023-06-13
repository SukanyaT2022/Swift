//
//  ViewController.swift
//  may14-Practice-Emp
//
//  Created by Tiparpron Sukanya on 5/14/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    let employees = [["name": "Jack", "dept": "A", "vehicles": ["Car", "Cycle", "scooter"]],
                         ["name": "Ket", "dept": "B", "vehicles": ["Car"]],
                         ["name": "Joe", "dept": "C", "vehicles": ["Car", "Cycle"]],
                         ["name": "Harry", "dept": "D", "vehicles": ["Cycle", "scooter"]],
                         ["name": "King", "dept": "E", "vehicles": ["Car", "scooter"]] //Employee Dictionary
                        ]// Array of employees
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return employees.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCellOne", for: indexPath) as? MyCellOne
            return cell!
        }
        
    
}
