//
//  ViewController.swift
//  may31-practiceJason1
//
//  Created by Tiparpron Sukanya on 5/31/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    
    @IBOutlet weak var myTableView: UITableView!
    var newsData: [NewsData]?// this var hold all data -array

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
     getNewData()
    }
    func getNewData() {
        NetworkHelper().getNews { result in//we create result is variable
            switch result{
            case .success(let data):
                self.newsData = data
                //below is refresh table view with new data line 29 to refresh ui we got new line 30
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
        

}

//when we select  cell so it go to next screen we use didselect function to do the task
extension ViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData?.count ?? 0//look line 14 var newsData
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCellOne", for: indexPath) as? MyCellOne
        let news = newsData?[indexPath.row]
        cell?.myCellOne.text = news?.title
        cell?.newData = news  // newData is var feom my cell one
        return cell!
    }
    //didselect use for move to next screen
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? MyCellOne
        self.performSegue(withIdentifier: "connect1screento2screen", sender:cell?.newData )
    }
   // pass data below
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let screen2 = segue.destination as? Screen2
        screen2?.news = sender as? NewsData
    }
    
    
}

