//
//  ViewController.swift
//  June 13-practicePecker1
//
//  Created by Tiparpron Sukanya on 6/13/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var myLabelLeft: UILabel!
    
    @IBOutlet weak var myLabelRight: UILabel!
    
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var myPickerView: UIPickerView!
    
    var arr = ["NYC", "BKK", "LONDON", "BEIJING"]
    var arr2 = ["USA", "Thailand","England", "China"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }

    @IBAction func myPickerAction(_ sender: UIDatePicker) {
        print (sender.date)
        let formater = DateFormatter()
        formater.locale = Locale.current
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss"// this is format date month year -- hour minute second
        let dateString = formater.string(from: sender.date)
    }
    
}
extension ViewController{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //2 array means we need -2 component means 2 column  so return 2
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return arr.count
        }else{
            return arr2.count
        }
    }
    // below type title-- for displaydata in picker view in component
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return arr[row] // row 0 will get NYC
        }else{
        return arr2[row]// row 0 in second component USA
        }
    }
    // func didSelect to identify which row is selected
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            myLabelLeft.text = arr[row]
        }else{
            myLabelRight.text = arr2[row]
        }
    }
}
