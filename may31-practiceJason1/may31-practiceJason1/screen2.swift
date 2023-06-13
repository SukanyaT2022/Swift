//
//  screen2.swift
//  may31-practiceJason1
//
//  Created by Tiparpron Sukanya on 6/8/23.
//

import Foundation
import UIKit
class Screen2: UIViewController{
    
    @IBOutlet weak var newImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var news : NewsData?
    override func viewDidLoad() {
        super.viewDidLoad()
     displayData()cos
    }
    func displayData() {
        titleLabel.text = news?.title // news line 18 var
        descriptionLabel.text = news?.description
        loadImage()
    }
    func loadImage(){
        if let imagePath = news?.urlToImage,
           let imageUrl = URL(string: imagePath){
            let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
                if let data = data{
                    let image = UIImage(data:data)
                    DispatchQueue.main.async {
                        self.newImageView.image = image
                        
                    }
                    
                }
                    
            }
            task.resume()
        }
    }
}
