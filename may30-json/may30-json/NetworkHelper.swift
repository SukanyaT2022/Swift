//
//  NetworkHelper.swift
//  may30-json
//
//  Created by Tiparpron Sukanya on 5/30/23.
// display data from remote or server 

import Foundation
class NetworkHelper{
    let path = "http://127.0.0.1:3000/employees"
    func getEmp(){
        let url = URL(string: path)
        //request step we want data and get a data so define get or post or delete
        var request = URLRequest(url: url!)//url -second -comefrom line 12
        request.httpMethod = "GET"
        //create task
        let task = URLSession.shared.dataTask(with:request) { data, response, error in
            if let error = error{
                print(error)
            }else{
                if let data = data{
                    let empJson = try? JSONSerialization.jsonObject(with: data) as? [[String:Any]]
                    print(empJson)
                    let empObjects = try? JSONDecoder().decode([EmpModel].self, from: data)//data line 21
                    print(empObjects)
                }
            
            
                    
            }
        }
        //excecuse task
        task.resume()
    }
}
