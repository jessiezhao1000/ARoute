//
//  MenuController.swift
//  ARoute
//
//  Created by Jessie Zhao on 3/15/23.
//

import Foundation
import UIKit

class ResultsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}


class MenuController: UIViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let tableViewController = UITableView()
    
    
    let searchController = UISearchController(searchResultsController: ResultsVC())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ARoute"
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else{
            return
        }
//        let vc = searchController.searchResultsController as? ResultsVC
//        vc?.view.backgroundColor = .yellow
        print(text)
    }
}
