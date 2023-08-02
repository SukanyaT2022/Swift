//
//  NewModel.swift
//  June8-practiceApi1
//
//  Created by Tiparpron Sukanya on 6/16/23.
//

import Foundation
// when we map data- when we get data from api it a mess-we need to organize data by format data
//{
//author = "Morgan :";
//content = "Mike Novogratz.Lucas Jackson/Reuters
//\n<ul>\n<li>The crypto market rally seems to be stalling as bitcoin notched its first monthly loss since November.</li>\n<li>Galaxy Digital CEO Mike Novogratz explai\U2026 [+1510 chars]";
//description = "\"The dog days of summer started early in crypto,\" Galaxy Digital's Mike Novogratz said. \"That doesn't make me thrilled.\"";
//publishedAt = "2023-06-01T16:49:39Z";
//source =             {
//id = "business-insider";
//name = "Business Insider";
//};
//title = "Galaxy Digital CEO Mike Novogratz says the 'dog days of summer' came early for crypto as bitcoin posts worst month since November";
//url = "https://markets.businessinsider.com/news/currencies/bitcoin-price-crypto-market-outlook-mike-novogratz-galaxy-digital-2023-6";
//urlToImage = "https://i.insider.com/5f92fdd5abcd0c0018d695d1?width=1200&format=jpeg";
//},
//


// key to to match with data otherwise if not match everything will fail
struct NewsData :Codable{
//    after var copy key above like author content description--and type after
    var author: String?
    var content: String?
    var description : String?
    var publishedAt: String?
//    source above is dictionary line 16 to 18-- each dictionary we need to create one struct
    var source: Source? // this Source link to line 39
    var title: String?
    var url : String?
    var urlToImage : String?
}
struct Source: Codable{
    var id : String?
    var name : String?
    
}
struct ResponseModel: Codable{
    var status : String?
    var totalResults: Int?
    var articles : [NewsData]?//article hold all data
    //responseModel is structure to match the data
}
