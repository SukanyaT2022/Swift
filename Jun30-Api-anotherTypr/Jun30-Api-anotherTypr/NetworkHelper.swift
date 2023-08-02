//
//  NetworkHelper.swift
//  Jun30-Api-anotherTypr
//
//  Created by Tiparpron Sukanya on 6/30/23.
//
//this step get data api // continue we have to path to the object structure and model
import Foundation
class NetworkHelper{
    let api_key = "2766dc19dd45557cc669fe651fc4adfb"
    let path = "https://api.themoviedb.org/3/movie/now_playing"
    
    func getMovie(){
        let url = URL(string: path)
      var request = URLRequest(url: url!)
        //add api key
        request.allHTTPHeaderFields = ["accept": "application/json",
                                       "Authorization": "Bearer 2766dc19dd45557cc669fe651fc4adfb"]
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with:request) { data, response, error in
            if let error = error{
                print(error)
            }else{
                //convert datat to jason to see it below line
                if let data = data{
                    let json = try? JSONSerialization.jsonObject(with:data)
                    print(json)
                }
            }
         
        }
        task.resume()
    }
    
}
