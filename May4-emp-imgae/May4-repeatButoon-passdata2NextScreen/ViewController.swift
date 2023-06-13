//
//  ViewController.swift
//  May4-repeatButoon-passdata2NextScreen
//
//  Created by Tiparpron Sukanya on 5/4/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
  
    
    let employees = [["name": "Jack", "Details": ["Address": "NYC", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1602233158242-3ba0ac4d2167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                     ["name": "Ket", "Details": ["Address": "LA", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1531416738519-cf1b25c203cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                     ["name": "Joe", "Details": ["Address": "UK", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1631947430066-48c30d57b943?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                     ["name": "Harry", "Details": ["Address": "AUS", "Phone": "9876543210", "image": "https://images.unsplash.com/photo-1628015081036-0747ec8f077a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z2lybHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"]],
                    ]
    
    
    @IBOutlet weak var myTableViewGreen: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableViewGreen.delegate = self
        myTableViewGreen.dataSource = self
    }


}

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "greenCell", for:indexPath) as? MyCellOneGreen// name of the class of cellone
        let oneEmployee = employees[indexPath.row]
        let name = oneEmployee["name"] as! String
        cell?.nameLabel.text = name
        cell?.details = oneEmployee["Details"] as! [String : String]
        //"Deatil" is key in array and details is variable on page myCellOneGreen et Deatils viewcontroller
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    //this function tell us which cell is selected and connect screen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MyCellOneGreen // is class
        performSegue(withIdentifier: "connectGreen2Red", sender:cell?.details)
    }
    //below we move data to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? DetailsViewController
        detailsVC?.details = sender as? [String:String]
    }
    
    
}

