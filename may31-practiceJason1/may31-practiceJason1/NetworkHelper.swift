//
//  NetworkHelper.swift
//  may31-practiceJason1
//
//  Created by Tiparpron Sukanya on 5/31/23.
//

import Foundation
class NetworkHelper{
    //code come from newsapi.org to all string is autorization to get data
    let api_key = "80633e12e9844047872d650f543ad575"
    let path = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=80633e12e9844047872d650f543ad575"
    
    func getNews(completion: @escaping(Result<[NewsData]?, Error>) -> Void){
        let url = URL(string: path)
        var request = URLRequest(url: url!)//url second one is from line 15
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //line below we check if error or not if error print error
            if let error = error{
                print(error)
                //june6 below
                completion(Result.failure(error))// completion comfrom line 14 in () which is parameter
                
            }else{
                //line data in byte convert to json
                if let data = data{
                    let newsJson = try? JSONSerialization.jsonObject(with: data)
                    print(newsJson)
                  
                    //june2  we map after crate to the model
                    
                    let mapedData = try? JSONDecoder().decode(ResponseModel.self, from: data)
                    //[NewsData] comefrom NewsModel file line 36 struct NewsModel
                   print(mapedData)
                   //june6 below
                    completion(Result.success(mapedData?.articles))//mapedData on line 34
                }
            }
              
        }
        task.resume()
    }
}

