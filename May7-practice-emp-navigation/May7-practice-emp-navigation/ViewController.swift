//
//  ViewController.swift
//  May7-practice-emp-navigation
//
//  Created by Tiparpron Sukanya on 5/7/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    let employees = [["name": "Jack", "Details": ["Address": "NYC", "Phone": "9876543210", "image": "jack_image.png"]],
                     ["name": "Ket", "Details": ["Address": "LA", "Phone": "9876543210", "image": "ket_image.png"]],
                     ["name": "Joe", "Details": ["Address": "UK", "Phone": "9876543210", "image": "joe_image.png"]],
                     ["name": "Harry", "Details": ["Address": "AUS", "Phone": "9876543210", "image": "harry_image.png"]],
                    ]
    
  
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
        
    }
    


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
}

