//
//  Country.swift
//  ConcurrencyLab
//
//  Created by Pursuit on 12/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

/*

 An image of the flag
 The country's name
 The country's capital
 The country's population
 Selecting on a cell should segue to another View Controller
 */
struct Country: Codable {
    let name: String
    let alpha2Code: String
    let region: String
    let population: Int
    
    //let 
    
}


extension Country {
    
    static func getCountryList() {
        
        guard let fileUrl = Bundle.main.url(forResource: "countryList", withExtension: "json")
            else {
                fatalError("check the json file")
        }
        do{
            
            let data = try Data(contentsOf: fileUrl)
            
            
            

        } catch {
            
            
        }
        
        
    }
    
}
