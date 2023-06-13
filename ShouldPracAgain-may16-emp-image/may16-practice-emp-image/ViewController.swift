//
//  ViewController.swift
//  may16-practice-emp-image
//
//  Created by Tiparpron Sukanya on 5/16/23.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellOne", for:indexPath) as? MyCellOne
        //show info of employees use var below
        //inderx path is a combination of cell and row in array
        let oneEmployee = employees[indexPath.row]
        let name = oneEmployee["name"] as! String
        cell?.nameLabel.text = name
        //store data details var in MyCellOne or pass data
        let details = oneEmployee[ "Details"]//Deatil come from key above [] in dict or array
        cell?.details = details as? [String:String]
        
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MyCellOne //MyCellOne is class
        //next line belowbegin to destination we use connection
        performSegue(withIdentifier: "connect2to3screen", sender:cell?.details)//details come from var from MyCellOne page to store data
        //next atore data in detail variable step look at line 47, 48 above
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lastScreen = segue.destination as? lastDetailScreen
        lastScreen?.detailsLastScreen = sender as? [String:String]
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

