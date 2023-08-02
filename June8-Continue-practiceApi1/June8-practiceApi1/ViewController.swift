//
//  ViewController.swift
//  June8-practiceApi1
//
//  Created by Tiparpron Sukanya on 6/8/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var myTableView: UITableView!
    var newData: [NewsData]? // use line 24
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        getNews()
    }
    func getNews(){
        NetWorkHelper().getNews { result in
            switch result {
            case .success(let data)://if success we gte data if not it failure get error
                self.newData = data // data from line 23
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as? Mycell
        let news = newData?[indexPath.row]
        cell?.newData = news
        cell?.myFirstLabel.text = news?.title
        
        return cell!
    }
    
// june 28 we pass to the next screen below function-- just type didselect
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? Mycell
        self.performSegue(withIdentifier:"connectScreen1to2", sender: cell?.newData)
    }
    //next pass data -type prepare for sender--sent data to next screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen2 = segue.destination as? Screen2
        screen2?.news = sender as? NewsData
    }
}
