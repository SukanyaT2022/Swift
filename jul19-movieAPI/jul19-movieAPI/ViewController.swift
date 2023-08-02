//
//  ViewController.swift
//  jul19-movieAPI
//
//  Created by Tiparpron Sukanya on 7/19/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet weak var myTableView: UITableView!
    var movieList: [MovieData]?
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        self.getMovieList()//call function line 21
    }
    func getMovieList(){
        NetworkHelper().getMovie { result in
            switch result{
            case .success(let data):
                self.movieList = data//got data
                //dispatchQueue-change then the way of process data operation-operate on main thread
                DispatchQueue.main.async {
                    self.myTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList?.count ?? 0 //?? 0 default value if movies list is empty so it can not count
    }
//this func line 41 create cell- then get data to the cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"mycell", for: indexPath) as? Mycell
        //display
        let movieData = movieList?[indexPath.row]
        cell?.myLabel.text = movieData?.title
        
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }


}

