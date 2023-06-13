//
//  EmpModel.swift
//  may30-json
//
//  Created by Tiparpron Sukanya on 5/30/23.
//
//crate object for pattern of data
//codable is protocol which empower the structure to map to the json
import Foundation
struct EmpModel:Codable{
    //all var look at key in dicts or key value pair
    var id: Int?
    var mobile: String?// ? for incase some info donot have data so we put ?
    var designation: String?
    var name: String?
}
