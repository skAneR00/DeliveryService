//
//  AppSearchMenu.swift
//  Delivery Service
//
//  Created by Admin on 07.04.2022.
//

import SwiftUI

struct AppSearchMenu: View {
    
    let deliveryCost = 200
    let items = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    var body: some View {
        LazyVGrid(columns: items){
            ScrollView{
                VStack(alignment: .leading){
                    Image("RegistrationBackground")
                        .resizable()
                        .cornerRadius(10)
                        .frame(height: 300)
                    Text("RestaurantName").font(.title2)
                    Text("Delivery cost: \(deliveryCost)")
                }.padding()
            }
        }
    }
}

struct AppSearchMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppSearchMenu()
    }
}
