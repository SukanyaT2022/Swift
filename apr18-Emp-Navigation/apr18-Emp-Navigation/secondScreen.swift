//
//  secondScreen.swift
//  apr18-Emp-Navigation
//
//  Created by Tiparpron Sukanya on 4/20/23.
//

import Foundation
import UIKit
class secondScreen:UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    
    @IBOutlet weak var myTableViewSecondScreen: UITableView!
    
    var vehicles: [String]?//? we can assign nil meand empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableViewSecondScreen.delegate = self
        myTableViewSecondScreen.dataSource = self
    }
}
extension secondScreen{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicles?.count ?? 0  // ?? means nil / empty -0 when emplye has no vehicle 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mySecondScreenCell", for:indexPath ) as? myCellSecondScreen
        cell?.mycellSecondScreenLabel.text = vehicles?[indexPath.row]
        return cell!
    }
    
}
