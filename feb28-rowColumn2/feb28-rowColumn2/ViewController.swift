//
//  ViewController.swift
//  feb28-rowColumn2
//
//  Created by Tiparpron Sukanya on 2/28/23.
//

import UIKit

class ViewController: UIViewController {
   
    
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //2 protocall for table-we have to use both
        //view-means rule
        //one is delegate - for ui
        //two is datasource- for data
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
//    pictureFrame(height: <#T##Int#>, width: <#T##Int#>)
//
//
//    }
//    func pictureFrame(height: Int, width:Int)
//    {
//        print(height)
//        print(width)
//    }
}
//we need this line below--if we not add line 10 UITableViewDelegate, UITableViewDataSource  need extension
extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        //means 4 rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"mainOne", for: indexPath)
        //if row 0 ==green else --secondrow we use .row==1
        if indexPath.row == 0{
            cell.backgroundColor = UIColor.green
        }else if indexPath.row == 1{
            cell.backgroundColor = UIColor.systemPink
        }
        else if indexPath.row == 3{
            cell.backgroundColor = UIColor.blue
        }
        return cell
    }
    //mainOne is identify and indexPath is
    
}
