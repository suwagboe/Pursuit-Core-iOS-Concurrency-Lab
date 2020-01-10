//
//  detailsViewController.swift
//  ConcurrencyLab
//
//  Created by Pursuit on 1/9/20.
//  Copyright © 2020 Pursuit. All rights reserved.
//

import UIKit

class detailsViewController: UIViewController {

    // outlets and variables
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var popLabel: UILabel!
    
    // need something for exchange rate.
    
    
    var selectedCountry: Country?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func loadData() {
        
        guard let c = selectedCountry else {
            fatalError("the deqeue did not pass properly. Please check again dear.. you'll get it eventually.")
        }
        
       // c.name = nameLabel
        
      //  c.population = popLabel
        
    }
    

}
