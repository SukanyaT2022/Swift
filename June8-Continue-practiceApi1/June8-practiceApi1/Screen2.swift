//
//  Screen2.swift
//  June8-practiceApi1
//
//  Created by Tiparpron Sukanya on 6/27/23.
//

import Foundation
import UIKit
class Screen2: UIViewController{
    
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var news : NewsData?
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
    }
    func displayData(){
        titleLabel.text = news?.title // news line 19
        descriptionLabel.text = news?.description
        authorLabel.text = news?.author
        //call function  below
        loadImage()
    }
    func loadImage(){
        if let imagePath = news?.urlToImage,
           let imageUrl = URL(string: imagePath){
            let task = URLSession.shared.dataTask(with: imageUrl){
                data, response, error in
                if let data = data{
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        self.myImageView.image = image
                        //myImageView come from var line12
                    }
                }
                
            }
            task.resume()
        }
    }
}
