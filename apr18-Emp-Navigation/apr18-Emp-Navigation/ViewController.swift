//
//  ViewController.swift
//  apr18-Emp-Navigation
//
//  Created by Tiparpron Sukanya on 4/18/23.
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
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
        //employee.count will add more row automatic --instead of put only 5 row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"myCellOne", for:indexPath) as? MycellOne
        let oneEmployee = employees[indexPath.row]
        let name = oneEmployee["name"] as! String
        let department = oneEmployee["dept"] as! String
        cell?.nameLabel.text = name
        cell?.DeptLabel.text = department
        cell?.vehicleData = oneEmployee["vehicles"] as? [String]// vehicle come line 16 key and vehicleData comeform Mycellone file var
        
        return cell!
    }
    //didselect will be call when we click particular row-- we target this row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath) as? MycellOne
        let vehicleData = cell?.vehicleData  // we get vehiccleData from mycellone
        //next line --how to make it go to the next page screen
        performSegue(withIdentifier: "firstScreen", sender: vehicleData)
    }
    //wheever we call perform segue line 55- automaticly 58 prepare segue will be call
    //segue: UIStoryboardSegue resonsible to connect 2 screen together--send data to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondScreen = segue.destination as? secondScreen
        secondScreen?.vehicles = sender as? [String]
    }
    
}
