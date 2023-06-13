//
//  ViewController.swift
//  May26-2time-prac-emp-Image
//
//  Created by Tiparpron Sukanya on 5/27/23.
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
        let oneEmployee = employees[indexPath.row]
        let name = oneEmployee["name"] as! String
        cell?.nameLabel.text = name
        cell?.details = oneEmployee["Details"] as? [String:String]//Details is key
        return cell!
    }
    //connect screen part use func below didselectRowat
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MyCellOne
        performSegue(withIdentifier:"connectScreen2to3",sender:cell?.details)
        //detail cone from var in mycellone file
    }
    
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
    //below prepare data from screen 2 to screen 3 --segue all about detination next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let lastscreen = segue.destination as? Screen3 //destination to scrren 3--screen 3 is class on page screen 3
        lastscreen?.detailLastScreen = sender as?[String:String]
        //detailLastScreen is var on screen 3 page -- line 18
    }
}
