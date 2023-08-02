//
//  NewModel.swift
//  jul19-movieAPI
//
//  Created by Tiparpron Sukanya on 7/24/23.
// do display next on weds

import Foundation


struct MovieData:Codable{
    var adult: Bool?
    var backdrop_path: String?
    var genre_ids: [Int]?
    var original_language: String?
    var original_title: String?
    var popularity: Double?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
    var id: Int?
    var overview:String?
}
//codable map data to structure encode and decode dat
struct Response:Codable{
    var page: Int?
    var total_results: Int?
    var total_pages: Int?
    var dates:Dates?
    var results: [MovieData]? // result for the whole data --put all data inside result
}

struct Dates: Codable{
    var maximum: String?
    var  minimum : String?
}
    

//{
//    adult = 0;
//    "backdrop_path" = "/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg";
//genre ids is array of int
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
