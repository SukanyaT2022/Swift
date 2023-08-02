//
//  NetworkHelper.swift
//  jul19-movieAPI
//
//  Created by Tiparpron Sukanya on 7/19/23.
//this page connect path line 11 path--convert data to responseline 30

import Foundation
class NetworkHelper{
    func getMovie(completion: @escaping(Result<[MovieData]?, Error>)->Void){
       let path = "https://api.themoviedb.org/3/movie/now_playing"
        let headers = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4YjRhODdmOGFjMTE3ZDBmYjFkYTBjMWU1YjgyOGMxMiIsInN1YiI6IjY0OWVmMjBmM2U2ZjJiMDEzOTJlMTE3NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.AMSHxLovqrU1F6lAWo5l1X5cNznvSKpkE7VM7tsXE6I"
        ]
        let url = URL(string:path) //path line 11
        //below create request--send the request to the server to get a data accrding to request
     var request = URLRequest(url:url!)//url behind fron=m line 16
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers // header line 12
        
        //next crate task
        let task = URLSession.shared.dataTask(with:request) { data, response, error in
            //if fail
            if let error = error{
                print(error)
                completion(.failure(error))
            }else{
                //if success
                if let data = data{
                    let json = try? JSONSerialization.jsonObject(with: data) as? [String:Any]
                    print(json)
                    let passObject = try? JSONDecoder().decode(Response.self, from: data)
                   print(passObject)
                    completion(.success(passObject?.results))
                }
            }
        }
        task.resume()
        
        

       
    }
}

//{
//    adult = 0;
//    "backdrop_path" = "/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg";
//    "genre_ids" =     (
//        28,
//        12,
//        878
//    );
//    id = 667538;
//    "original_language" = en;
//    "original_title" = "Transformers: Rise of the Beasts";
//    overview = "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.";
//    popularity = "8466.323";
//    "poster_path" = "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg";
//    "release_date" = "2023-06-06";
//    title = "Transformers: Rise of the Beasts";
//    video = 0;
//    "vote_average" = "7.3";
//    "vote_count" = 1431;
//},
