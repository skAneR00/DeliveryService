//
//  AppSearchMenu.swift
//  Delivery Service
//
//  Created by Admin on 07.04.2022.
//

import SwiftUI

struct AppSearchMenu: View {
    
    let searchController = UISearchController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        UISearchController = searchController
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AppSearchMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppSearchMenu()
    }
}
