//
//  DataBaseController.swift
//  Delivery Service
//
//  Created by Admin on 06.03.2022.
//

import Foundation
import CoreData


class DataBase: ObservableObject{
    let container = NSPersistentContainer(name: "UserDataBase")
    
    init(){
        container.loadPersistentStores{description, error in
            if let error = error{
                print("Failed \(error.localizedDescription)")
            }}
    }
}
