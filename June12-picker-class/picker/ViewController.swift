//
//  ViewController.swift
//  picker
//
//  Created by 2053384 on 12/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myPickerView: UIPickerView!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    let dataArr = ["NYC", "BKK", "IND", "AUS", "US", "UK"]
    let numArr = ["1", "2", "3", "4", "5", "6"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myPickerView.delegate = self
        myPickerView.dataSource = self
    }


    @IBAction func myDatePickerAction(_ sender: UIDatePicker) {
        print(sender.date)
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "IST")
//        formatter.timeZone = TimeZone.current
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.dateFormat = "HH:mm"

        let dateStr = formatter.string(from: sender.date)
        print(dateStr)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return numArr.count
        }
        return dataArr.count
    }
    
    // Display data on rows such as US, UK, AUS
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 { // component 0: for numbers like: 1, 2 ,3 4
            return numArr[row]
        } else {
            return dataArr[row] // component 1: for numbers like: US, UK, AUS
        }
    }
    
    // for selecting the row
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            print(numArr[row])
        } else {
            print(dataArr[row])
        }
    }
    
}
