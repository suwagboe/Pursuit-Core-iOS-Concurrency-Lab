//
//  countryListCell.swift
//  ConcurrencyLab
//
//  Created by Pursuit on 12/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class countryListCell: UITableViewCell {
    /*
    An image of the flag
    The country's name
    The country's capital
    The country's population
    Selecting on a cell should segue to another View Controller
 */
    @IBOutlet weak var countryFlagImage: UIImageView!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var countryCapitalLabel: UILabel!
    @IBOutlet weak var countryPopLabel: UILabel!
    
    private var urlString = ""
    
    override func prepareForReuse() {
        super.prepareForReuse()
      //  self.countryFlagImage = nil
    }

   // country.alphacode in order to get the country code
    
    func configureCell(with country: Country) {
        
       let urlString = "https://www.countryflags.io/\(country.alpha2Code)/flat/64.png"
        
        countryFlagImage.getImage(with: urlString) { [weak self] result in
            switch result {
                
            case .failure:
    // why dont you write it like this: case .failure(let appError)
                DispatchQueue.main.sync {
                    self?.countryFlagImage.image = UIImage(systemName: "person.fill")
                }
            case .success(let image):
// ???why not leave this one blank as well ????
                DispatchQueue.main.sync {
                        self?.countryFlagImage.image = image
                }
                
            }
            
            
            
        }
        
        
    }
}
