//
//  SearchController.swift
//  Delivery Service
//
//  Created by Admin on 07.04.2022.
//

import Foundation
import UIKit

class ViewControll: UIViewController{
    
    let searchController = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController
    }
}
