//
//  DetailsViewController.swift
//  May4-repeatButoon-passdata2NextScreen
//
//  Created by Tiparpron Sukanya on 5/10/23.
//

import Foundation
import UIKit
class DetailsViewController: UIViewController{
    var details: [String:String]?
    @IBOutlet weak var adressLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var empImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //call function below
     displayDetails()
    }
    func displayDetails(){
      if let address = details?["Address"],// inside [] inside is key need to match in employee array on viewcontroller page
         let phoneNumber = details?["Phone"],
         let imagePath = details?["image"]{
          adressLabel.text = address // .text mean show on text
          phoneLabel.text = phoneNumber
          empImageView.image = UIImage(data:try! Data(contentsOf: URL(string: imagePath)!))// .image means we want to show image
          //adresslabel look line 12 outlet
      }
    }
}
