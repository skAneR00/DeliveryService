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
                                    Image("RegistrationBackground")
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
                                    Image("RegistrationBackground")
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
                                    Image("RegistrationBackground")
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
                            .foregroundColor(.init(Color.RGBColorSpace.sRGB, red: 0.51, green: 0.27, blue: 0.63, opacity: 1))
                        HStack(alignment: .top, spacing: 35){
                            Image(systemName: "house")
                                .resizable()
                                .frame(width: 50, height: 50)
                            NavigationLink(destination: TestUIFile(), label: {
                                Image("SpoonPng")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            })
                            NavigationLink(destination: TestUIFile(), label: {
                                Image(systemName: "magnifyingglass.circle")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }).colorMultiply(.black)
                            NavigationLink(destination: TestUIFile(), label: {
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
