//
//  ViewController.swift
//  May3-Button-ConnectScreen
//
//  Created by Tiparpron Sukanya on 5/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButtonOrange: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func myButtonActionOrange(_ sender: Any) {
        //use print to check if the fuction working or not
        print("myOrangeButtonTap")
        
        //performSegue work for connect the screen
        performSegue(withIdentifier: "go2Green", sender: "LoLo")//this line naviagate and pass data
        //sender is what you want to send what data
    }
    //this function responsible to pass data from ornage screen to green screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let greenScreen = segue.destination as? GreenViewController 
        greenScreen?.displayName = sender as? String  // displayName is in GreenViewController
    }
}

