//
//  NewModel.swift
//  may31-practiceJason1
//
//  Created by Tiparpron Sukanya on 6/2/23.
//

import Foundation

//create model to map data
// back end have raw data but we : to format the data


//{
//author = "Matthew Fox";
//content = "U.S. President Joe Biden and Speaker of the House Kevin McCarthy (R-CA) depart the U.S. Capitol following the Friends of Ireland Luncheon on Saint Patrick's Day March 17, 2023 in Washington, DC. The \U2026 [+2917 chars]";
//description = "Treasury Secretary Janet Yellen warned that \"time is running out\" and that the debt ceiling showdown is already impacting Americans.";
//publishedAt = "2023-05-16T13:40:31Z";

    //sources is dictionary coz it wrap inside {} so we need to create new struct
//source =             {
//id = "business-insider";
//name = "Business Insider";
//};
//title = "US stocks fall ahead of renewed debt ceiling talks in Washington";
//url = "https://markets.businessinsider.com/news/stocks/stock-market-news-today-renewed-debt-ceiling-talks-biden-mccarthy-2023-5";
//urlToImage = "https://i.insider.com/6463811c3c46f3001898e0e3?width=1200&format=jpeg";
//},
//we format data we need all below.
//struct start with capital name
//codeable make it able to decode(change byte to model) and encode(changefrom model  to byte )
struct NewsData :Codable{
    var author: String?
    var content : String?
    var description : String?
    var publishedAt : String?
    var source : Source? //Sources link to line 39 below next to struct
    var title: String?
    var url: String?
    var urlToImage: String?
    
}
struct Source :Codable {
    var id: String?
    var name: String?
}
struct ResponseModel: Codable{
    var status: String?
    var totalResults: Int?
    var articles:[NewsData]?
    //article hold the whole data
   // responsemodel task is to match data
}
    
    

