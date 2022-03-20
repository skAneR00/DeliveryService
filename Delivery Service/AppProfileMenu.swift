//
//  AppProfileMenu.swift
//  Delivery Service
//
//  Created by Admin on 20.03.2022.
//

import SwiftUI

struct AppProfileMenu: View {
    
    
    
    @Environment(\.managedObjectContext) var  moc
    @FetchRequest(sortDescriptors: []) var UserDatabase: FetchedResults<UserDataBase>
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.gray)
                    .frame(width: .infinity, height: 200)
                HStack{
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    VStack{
                        Text("Name SecondName").font(.title).padding()
                        Text("PhoneNumber").font(.title2)
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
            }
        }
    }
}

struct AppProfileMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppProfileMenu()
    }
}
