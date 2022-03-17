//
//  FirstTimeChecker.swift
//  Delivery Service
//
//  Created by Admin on 10.03.2022.
//

import Foundation
import UIKit

class ViewController : UIViewController{
     
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if defaults.bool(forKey: "FirstLaunch") == true{
            
            print("Second +")
            
            defaults.set(true, forKey: "FirstLaunch")
        }
        else{
            
            print("First")
            
            defaults.set(true, forKey: "FirstLaunch")
        }
    }
}
