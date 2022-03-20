//
//  AppMainMenu.swift
//  Delivery Service
//
//  Created by Admin on 10.03.2022.
//

import SwiftUI

struct AppMainMenu: View {
    
    
    func GoTo(){
        
    }
    
    var body: some View {
        VStack{
            
            Text("Actions:").font(.title)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<5) {_ in
                        Image("RegistrationBackground")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .onTapGesture {
                                print("ItemWasTapped")
                            }
                    }
                }
            }
            
            Text("Restaurants: ").font(.title)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<5) {_ in
                        Image("RegistrationBackground")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .onTapGesture {
                                print("ItemWasTapped")
                            }
                    }
                }
            }
            
            Text("Productcs: ").font(.title)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(0..<5) {_ in
                        Image("RegistrationBackground")
                            .resizable()
                            .frame(width: 150, height: 150)
                            .onTapGesture {
                                print("ItemWasTapped")
                            }
                    }
                }
            }
            
            ZStack{
                //DownToolBar
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: .infinity, height: 150)
                    .ignoresSafeArea()
                    .foregroundColor(.gray)
                    .opacity(0.9)
                HStack(alignment: .top, spacing: 35){
                    
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image("SpoonPng")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "magnifyingglass.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "cart")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .onTapGesture{
                            print("Tapped")
                        }
                }.frame(width: .infinity, height: 100, alignment: .top)
            }.position(x: 214,y: 200)
        }
    }
}

struct AppMainMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppMainMenu()
    }
}
