//
//  AppMainMenu.swift
//  Delivery Service
//
//  Created by Admin on 10.03.2022.
//

import SwiftUI

struct AppMainMenu: View {
    
    let columns = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    var body: some View {
        NavigationView{
            LazyVGrid(columns: columns){
                ZStack{
                    ScrollView{
                        Text("Actions:").font(.title)
                        
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<5) {_ in
                                    Image("Stas")
                                        .resizable()
                                        .frame(width: 150, height: 200)
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            print("ItemWasTapped")
                                        }
                                }
                            }
                        }
                        
                        Text("Restaurants: ").font(.title)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<5) {_ in
                                    Image("GeniusVHalate")
                                        .resizable()
                                        .frame(width: 150, height: 200)
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            print("ItemWasTapped")
                                        }
                                }
                            }
                        }
                        
                        Text("Productcs: ").font(.title)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(0..<5) {_ in
                                    Image("Ildar")
                                        .resizable()
                                        .frame(width: 150, height: 200)
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            print("ItemWasTapped")
                                        }
                                }
                            }
                        }
                    }
                    
                    ZStack{
                        //DownToolBar
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 428, height: 150)
                            .ignoresSafeArea()
                            .foregroundColor(.indigo)
                        HStack(alignment: .top, spacing: 35){
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 50, height: 50)
                            NavigationLink(destination: AppRestaurantMenu(), label: {
                                Image("SpoonPng")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            })
                            NavigationLink(destination: AppShopsMenu(), label: {
                                Image(systemName: "cart")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }).colorMultiply(.black)
                            NavigationLink(destination: AppProfileMenu(), label: {
                                Image(systemName: "person.crop.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }).colorMultiply(.black)
                            }.frame(width: 428, height: 100, alignment: .top)
                    }.position(x: 214, y: 780)
                }
            }
            .navigationTitle("Menu")
                .navigationBarTitleDisplayMode(.inline)
        }.navigationBarHidden(true)
    }
}

struct AppMainMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppMainMenu()
    }
}
