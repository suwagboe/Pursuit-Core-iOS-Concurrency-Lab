//
//  NetworkHelper.swift
//  ConcurrencyLab
//
//  Created by Pursuit on 12/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

//MARK: Singleton
// we need to make out NetworkHelper a singleTon
//this means there will only ever be one instance of this class
//throughout the application, at no point will someone be able to create a new instance example NetWorkHelper() will be a compiler error

// why class because we have reference ....
class NetworkHelper {
    
    // we will create a shared instance of the NetworkHelper
    static let shared = NetworkHelper()
    
    private var session: URLSession
    
    // we will make the default initializer private
    // required in order to be considered a singleton
    //also forbid anyone from creating an instance of NetworkHelper
    private init(){
        session = URLSession(configuration: . default)
        
    }
    func performDataTask(with urlString: String, completion: @escaping(Result<Data, AppError>) -> ()) { // if we say return data it would always return zero because the closure is not complited yet the closure itself is a asynchronous
        
        // creating a url from the given String
        guard let url = URL(string: urlString) else {
            // handle bad url error case
            completion(.failure(.badURL(urlString)))
            return
        }
//        let url = URL(
//        let request = URLRequest(url: urlString)

        // two states on dataTask, resume() and suspended by default
        // suspended simply wont perform network request
        // this ultimately leads to debugging error and time lost if you don't explicitly resume() request
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            //MARK: 1. deal with error if any
            // check for client network error
            if let error = error {
                completion(.failure(.networkClientError(error)))
            }
            // MARK: 2. downcast URLResponse (response) to HTTPURLResponse to get access to the statusCode property on HTTPURLResponse
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            //MARK: 3. unwrap the data object
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            //MARK: 4. validate that the status code is in the 200 range otherwise it's a bad status code
            switch urlResponse.statusCode {
            case 200...299: break // everything went well here
            default:
                completion(.failure(.badStatusCode(urlResponse.statusCode)))
                return
                
            }
            //MARK: 5. capture data as success case
            completion(.success(data))
        }
        dataTask.resume()
    }
}
//MARK: Notes ->
//completion handler closure used to capture the reponse data or error of an asynchronous network request
// @escaping because the closure is not completed unless the data comes back to the data

// escaping closure we need ..
// <> generic symbols for sets
