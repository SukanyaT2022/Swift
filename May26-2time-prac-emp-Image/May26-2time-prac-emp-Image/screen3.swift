//
//  screen3.swift
//  May26-2time-prac-emp-Image
//
//  Created by Tiparpron Sukanya on 5/30/23.
//

import Foundation
import UIKit
class Screen3: UIViewController{
    
    @IBOutlet weak var empImageView: UIImageView!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
   
    var detailLastScreen: [String:String]?
    // this var hold data from first screen
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData() // line 25 mistake  forget to call function displayData
    }
    
    func displayData(){
        phoneLabel.text = detailLastScreen?["Phone"]//["Phone"] is key fron dict array
        addressLabel.text = detailLastScreen?["Address"]
        if let path = detailLastScreen?["image"]{
          loadImage(path:path)
        }
    }
    func loadImage(path:String){
        if let url = URL(string: path){
            let task = URLSession.shared.dataTask(with:url){
             data, response, error in
                if error != nil{
                    print(error)
                }else{
                    if let imageData = data{
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.empImageView.image = image
                        }
                    }
                    
                }
            }
            task.resume()
        }
       
    }
}
