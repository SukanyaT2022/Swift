//
//  ViewController.swift
//  apr4-practice-emp
//
//  Created by Tiparpron Sukanya on 4/24/23.
//

import UIKit

class ViewController: UIViewController{
    
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

extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
        //insted of put 5 put employees.count will auto adjust row
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellOne", for: indexPath) as? MyCellOne
        let oneEmployee = employees[indexPath.row]
        let name = oneEmployee["name"] as! String
        let department = oneEmployee["dept"] as! String
        cell?.nameLabel.text = name
        cell?.deptLabel.text = department
        cell?.vehicles = oneEmployee["vehicles"] as? [String]
        return cell!
     
    }
    //all line below work on pass data
    //didselect use when click particular row to select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at:indexPath) as? MyCellOne //MyCellOne is class
        
        // step-go to next screeen--> type perform --pick the one have sender-create connection to next screen
        //if we select it go to the next screen ex move to scrren 3 connection -- meand pass data
        performSegue(withIdentifier: "screen3", sender: cell?.vehicles)
        
    }
    //this below carry data--seque is connection to send the data to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen3 = segue.destination as? Screen3orange //Screen3orange is class
        let vehicleData = sender as? [String]
        screen3?.vehicle4Screen3 = vehicleData  // vehicle4screen3 is variable come from page screen3orange
        
    }
    
    
}
