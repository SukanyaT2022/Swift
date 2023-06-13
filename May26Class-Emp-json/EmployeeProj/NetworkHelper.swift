//
//  NetworkHelper.swift
//  EmployeeProj
//
//  Created by 2053384 on 26/05/23.
//

import Foundation

class NetworkHelper {
    //http://localhost:3000/employees
    //http://127.0.0.1:3000/employees
    /*
     GET - Reading/Getting data from Server
     POST - Posting/Sending the data to server for New Entry
     PUT - Posting/Sending the data to server for updating an existing data
     DELETE - Deletion of data in server
     
     C - Create - POST
     R - Read - GET
     U - Update - PUT
     D - Delete - DELETE
     */
    
    func getEmpployees() {
        let url = URL(string: "http://127.0.0.1:3000/employees")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                // Failure
                print(error)
            } else {
                // Success
                if let data = data {
                    let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                    print(json)
                    
                    let employeeObjs = try? JSONDecoder().decode([EmployeeModel].self, from: data)
                    print(employeeObjs)
                    print(employeeObjs?.first?.name)
                }
            }
        }
        task.resume()
    }
}
