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
    var name: String
    let alpha2Code: String
    let region: String
    let population: Int
    let capital: String
    let currencyInfo: [Currencies]
    //let 
    
}

struct  Currencies: Codable {
    let code: String
    let symbol: String
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
