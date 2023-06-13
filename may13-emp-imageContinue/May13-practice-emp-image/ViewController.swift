//
//  ViewController.swift
//  May13-practice-emp-image
//
//  Created by Tiparpron Sukanya on 5/13/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
 
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    let employees = [["name": "Jack", "Details": ["Address": "NYC", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                     ["name": "Ket", "Details": ["Address": "LA", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1531416738519-cf1b25c203cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                     ["name": "Joe", "Details": ["Address": "UK", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1631947430066-48c30d57b943?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                     ["name": "Harry", "Details": ["Address": "AUS", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1628015081036-0747ec8f077a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellOne", for: indexPath) as? MyCellOne
        // id myCellOne-- MyCellOne is class
        //show info of employee use var below
        //indexPath is combination of cell and row in array
        //step 1 just show name
        let oneEmployee = employees[indexPath.row]
        let name = oneEmployee["name"] as! String
        cell?.myLabelName.text = name
        
// next store data on details variable that from from myCellOne
        let details = oneEmployee["Details"]
        cell?.details = details as? [String:String]//? is optinal value
        return cell!
    }
    
    // next how user need to select the row of one of the employees first and then it will go to the next screen -- we use didSelectRowat function below
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MyCellOne // MyCellOne is class of first screen
        // then from the begin to the destination we use connection -- function performSeque
        performSegue(withIdentifier: "connection2to3screen", sender:cell?.details)
        //sender:cell?.detail come from variable in myCellOne folder to store data
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //below function prepareforSegue is for send data --perform segue is for go to the next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondPage = segue.destination as? SecondPage
        //second we crate variable
        secondPage?.detailSecondPage = sender as? [String:String]
    }
    
}
