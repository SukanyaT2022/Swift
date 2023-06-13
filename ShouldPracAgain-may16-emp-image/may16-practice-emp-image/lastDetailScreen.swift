//
//  lastDetailScreen.swift
//  may16-practice-emp-image
//
//  Created by Tiparpron Sukanya on 5/24/23.
//

import Foundation
import UIKit

class lastDetailScreen: UIViewController{
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var empImageView: UIImageView!
    
    @IBOutlet weak var empPhoneView: UILabel!
    
    @IBOutlet weak var empAddressView: UILabel!
    
    var detailsLastScreen : [String:String]?// this var will hold data from first screen
    
    override func viewDidLoad() {
       super.viewDidLoad()
       displayData()
    }
    func displayData(){
        empPhoneView.text = detailsLastScreen?["Phone"] //"Phone" is key from eomplyess dict on view controller page
        
        empAddressView.text = detailsLastScreen?["Address"]
        if let path = detailsLastScreen?["image"]{
         loadImage(path: path)
        }
       
    }
    func loadImage(path:String){
        if let url = URL(string: path){
            let task = URLSession.shared.dataTask(with:url) { data, response,error in
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
            task.resume()//task will excute
            
        }
    }
}


