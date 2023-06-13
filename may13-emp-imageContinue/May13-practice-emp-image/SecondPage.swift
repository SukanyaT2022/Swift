//
//  SecondPage.swift
//  May13-practice-emp-image
//
//  Created by Tiparpron Sukanya on 5/17/23.
//

import Foundation
import UIKit
class SecondPage: UIViewController{
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    var detailSecondPage: [String:String]? // if we donot know data we use [String: Any]
    override func viewDidLoad() {
        super.viewDidLoad()
        //call function
        dispayData()
    }
    func dispayData(){
        addressLabel.text = detailSecondPage?["Address"]
        phoneLabel.text = detailSecondPage?["Phone"]
        
        //lines below update may 19
        if let imagePath = detailSecondPage?["image"]{
            downloadImage(path: imagePath)
        }
    }
    //lines below update may 19
    
    func downloadImage(path: String) {
            if let url = URL(string: path) {
                let task = URLSession.shared.dataTask(with: url) { data, response, error in
                    if error != nil {
                        print(error)
                    } else {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            DispatchQueue.main.async {
                                self.imageView.image = image
                            }
                                                }
                                            }
                                        }
                                        task.resume()
                                    }
                                }
}
