//
//  ViewController.swift
//  tableview
//
//  Created by 2053384 on 24/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    // Number of section need to be declared here
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // Number of rows need to be declared here for each section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 1 {
            return 2
        }
        return 3
    }
    
    // height of rows need to be declared here
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // This function is resposible for creation of row/Cell.
    // This function gets called multiple time i.e. call will be equal to total number of rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainOne", for: indexPath) as? CustomCell
        cell?.rowLabel.text = "Row: \(indexPath.row)"
        cell?.sectionLabel.text = "Section: \(indexPath.section)"
//        print(indexPath)
        return cell!
    }
    
    // This is executed when the cell is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected RowIndex: \(indexPath)")
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.green
    }
    
    // This is executed when the cell is deselected(when new cell will be selected, previously selected cell will be autmatically deselected)
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselect RowIndex: \(indexPath)")
        let cell = tableView.cellForRow(at: indexPath)
        cell?.backgroundColor = UIColor.systemMint

    }
    
}
