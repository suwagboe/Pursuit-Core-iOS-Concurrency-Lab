//
//  countryAPIClient.swift
//  ConcurrencyLab
//
//  Created by Pursuit on 12/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

enum AppError: Error {
  case badURL(String) // associated value
  case noResponse
  case networkClientError(Error) // no internet connection
  case noData
  case decodingError(Error)
  case badStatusCode(Int) // 404, 500
  case badMimeType(String) // image/jpg
}


struct countryAPIClient {
    
  //  static func getCountries(for searchQuery: String completion: @escaping (Result <[Country], AppError>) ->()) {
      //  let endpointURLString = "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png"
        
            // var country = [country]()
        
      //  NetworkHelper.shared
   
    /*
    static func getCountries(completion: @escaping (Result <[Country], AppError>) -> ()){
        
       // the url
        let countryEndpointURL = "https://www.countryflags.io/\("lk")/flat/64.png"
        
        //"https://restcountries.eu/rest/v2/name/united"
       
        //"https://www.countryflags.io/\(country.alpha2Code)/flat/64.png"
        
        // making the string into a url
        guard let url = URL(string: countryEndpointURL) else {
            completion(.failure(.badURL(countryEndpointURL)))
            return
        }
        
        //make the url request
        let request = URLRequest(url: url)
        
        // now to get the data from the request
        
    }
    */
    
    static func getCountries(completion: @escaping (Result <[Country], AppError>) -> () ) {

        let countryEndpointURL = "https://restcountries.eu/rest/v2/name/united"
        
//        guard let url = URL(string: countryEndpointURL) else {
//            completion(.failure(.badURL(countryEndpointURL)))
//            return
//        }

        
        NetworkHelper.shared.performDataTask(with: countryEndpointURL) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(appError))
            case .success(let data):
                do {
                    let countries = try JSONDecoder().decode([Country].self, from: data)
                    
                    completion(.success(countries))
                }catch{
                    completion(.failure(.decodingError(error)))
                }
            }
        }
        
    }
    
    // getFlag(alpha2code: Int)

    
    }
    

