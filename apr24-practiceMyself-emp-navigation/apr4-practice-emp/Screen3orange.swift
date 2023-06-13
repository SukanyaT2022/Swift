//
//  Screen3orange.swift
//  apr4-practice-emp
//
//  Created by Tiparpron Sukanya on 5/1/23.
//

import Foundation
import UIKit

class Screen3orange:UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    var vehicle4Screen3: [String]?
    //the data from screen2 to screen 3-will come to this variable to display
    
    @IBOutlet weak var screen3TableView: UITableView!
    
    //viewdidload this func use for when load new screen
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen3TableView.delegate = self
        screen3TableView.dataSource = self
    }
    
}
extension Screen3orange{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicle4Screen3?.count ?? 0 //incase ?? 0 if some employee do not have vehicle
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell2", for:indexPath) as? MyCellTwo
        cell?.myLabelMyCellTwo.text = vehicle4Screen3?[indexPath.row]
        return cell!
    }
    //this function responsible find out which cell is selected-screen4 -
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "connectScreen4", sender: nil)// this line response for move to the next screen.
    }
}
