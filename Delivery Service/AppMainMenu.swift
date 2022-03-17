//
//  AppMainMenu.swift
//  Delivery Service
//
//  Created by Admin on 10.03.2022.
//

import SwiftUI

struct AppMainMenu: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10).frame(width: .infinity, height: 150).ignoresSafeArea().position(x: 214, y: 850).foregroundColor(.gray).opacity(0.9)
                Text("Actions:").position(x: 60, y: 25).font(.title)
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
                }.position(x: 215, y: 120)
                
                
                //DownToolBar
                
                Image(systemName: "person.crop.circle").resizable().frame(width: 50, height: 50).position(x: 380, y: 810).onTapGesture{
                    print("Tapped")
                }
                Image(systemName: "magnifyingglass.circle").resizable().frame(width: 50, height: 50).position(x: 295, y: 810)
                Image(systemName: "cart").resizable().frame(width: 50, height: 50).position(x: 210, y: 810)
                Image("SpoonPng").resizable().frame(width: 50, height: 50).position(x: 125, y: 810)
                Image(systemName: "house").resizable().frame(width: 50, height: 50).position(x: 40, y: 810)
                
            }
        }
    }
}

struct AppMainMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppMainMenu()
    }
}
