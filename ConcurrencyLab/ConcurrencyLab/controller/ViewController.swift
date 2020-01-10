//
//  ViewController.swift
//  ConcurrencyLab
//
//  Created by Pursuit on 12/9/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // with networkHelper you pass in url and gives you data...
    // urlSession should not occur in more than one place...
    
    // need a custom cell.. 
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var country = [Country]()
    
    var searchText: String? {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     // first practice push...
        tableView.dataSource = self
        searchBar.delegate = self
        loadData()
        
        // enteredText = "l"
        
    }
    
    func loadData() {
        countryAPIClient.getCountries(completion: {
            [weak self] result in
            switch result {
            case .failure(let appError):
                fatalError("this doesn't work \(appError)")
            case .success(let country):
                self?.country = country
            }
            })
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath) as? countryListCell else {
            fatalError("the cell name must be labels everywhere shaniya please check ALL parts ")
        }
                
        let selected =  country[indexPath.row]
        
        cell.configureCell(with: selected)
        
        return cell
    }
    
}

extension ViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        //need to access the data typed into the search bar.
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        //searchCountries(searchQuery: searchBar.text)
        
        
        // how to dectivate the keyboard
        searchBar.resignFirstResponder()
    }
}

