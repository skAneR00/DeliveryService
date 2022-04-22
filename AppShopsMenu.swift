//
//  AppShopsMenu.swift
//  Delivery Service
//
//  Created by Admin on 10.04.2022.
//

import SwiftUI

struct AppShopsMenu: View {
    let raiting : Double = 10.0
    let deliveryCost = 200
    let items = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    @State var flag: Bool = false
    
    var body: some View {
        NavigationView{
            LazyVGrid(columns: items){
                ZStack{
                    
                    ScrollView{
                            VStack(alignment: .leading){
                                NavigationLink(destination: AppRestaurantInfo(), isActive: $flag, label:{
                                    Image("RegistrationBackground")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(height: 300)
                                        .onTapGesture {
                                            AppMainMenu.ItemChecker = "RegistrationBackground"
                                            flag = true
                                        }
                                })
                                Text("ShopName").font(.title2)
                                HStack(spacing: 10){
                                    Text("Delivery cost: \(deliveryCost)")
                                    Text("Raiting: \(NSString(format:"%.2f", raiting))")
                                }
                            }.padding()
                                .foregroundColor(.black)
                        
                            VStack(alignment: .leading){
                                NavigationLink(destination: AppRestaurantInfo(), isActive: $flag, label: {
                                    Image("Vova")
                                        .resizable()
                                        .cornerRadius(10)
                                        .frame(height: 300)
                                        .onTapGesture {
                                            AppMainMenu.ItemChecker = "Vova"
                                            flag = true
                                        }
                                })
                                Text("ShopName").font(.title2)
                                HStack(spacing: 10){
                                    Text("Delivery cost: \(deliveryCost)")
                                    Text("Raiting: \(NSString(format:"%.2f", raiting))")
                                }
                            }.padding()
                            .foregroundColor(.black)
                    }
                    
                    
                    ZStack{
                        //DownToolBar
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 428, height: 150)
                            .ignoresSafeArea()
                            .foregroundColor(.indigo)
                        HStack(alignment: .top, spacing: 35){
                            NavigationLink(destination: AppMainMenu(), label: {
                                Image(systemName: "house")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }).colorMultiply(.black)
                            NavigationLink(destination: AppRestaurantMenu(), label: {
                                Image("SpoonPng")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }).colorMultiply(.black)
                            Image(systemName: "cart")
                                .resizable()
                                .frame(width: 50, height: 50)
                            NavigationLink(destination: AppProfileMenu(), label: {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }).colorMultiply(.black)
                            }.frame(width: 428, height: 100, alignment: .top)
                    }.position(x: 214, y: 780)
                }
            }.navigationTitle("The Shops")
                .navigationBarTitleDisplayMode(.inline)
        }.navigationBarHidden(true)
    }
}

struct AppShopsMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppShopsMenu()
    }
}
