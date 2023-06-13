//
//  NetworkHelper.swift
//  June8-practiceApi1
//
//  Created by Tiparpron Sukanya on 6/8/23.
//

import Foundation
class NeetWorkHelp{
    
    //code comeform newsipa.org
    let api_key = "80633e12e9844047872d650f543ad575"
    let path = " https://newsapi.org/v2/everything?q=bitcoin&apiKey=80633e12e9844047872d650f543ad575"
    
    func getNews(){
        let url = URL(string:path)
        //create resuest data
        var request = URLRequest(url:url!)
      // url second is comsfrom line 16
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response , error in
            if let error = error{
                print(error)
            }else{
                //thid line below in byte convert to jason
                if let data = data{
                    let newJson = try? JSONSerialization.jsonObject(with: data)
                    print(newJson)
                    
                }
            }
        }
        task.resume()
        
    }
}
