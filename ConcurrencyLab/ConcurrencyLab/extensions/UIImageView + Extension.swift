//
//  UIImageView + Extension.swift
//  ConcurrencyLab
//
//  Created by Pursuit on 12/12/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

extension UIImageView {
    // takes the url string and gets the image from there
    // this extension is directly tied to the image view.
    // instance method
    func getImage(with urlString: String,
                  completion: @escaping (Result< UIImage, AppError>) -> ()) {
        // the completion only captures the value
        // configure UIActivityIndicatorView
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .orange
        activityIndicator.center = center// the same as the center of the cell.
        addSubview(activityIndicator)
        // self.addSubview(activityIndicator) is NOT necessary
        
        activityIndicator.startAnimating()
        
        
        NetworkHelper.shared.performDataTask(with: urlString) { [weak activityIndicator] (result) in
            // using a capture list which is []..
            // two objects with strong refernce creates memory leaks
            //[weak activityIndicator] this stops memory leaks
            DispatchQueue.main.async{
                activityIndicator?.stopAnimating()
            }
            
            // what thread are we on here?
            // - main thread
            // -updateUI
            
            switch result {
            case .failure(let appError):
                //
                // appError .. is the associated Value
                // reread the assocated values..
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                if let image = UIImage(data: data) {
                    completion(.success(image))
                    // get back the image here..
                }
            }
            // share is a singleton.. all public initializers are private
        }
    }
}

