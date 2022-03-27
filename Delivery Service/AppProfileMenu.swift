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
    
    //For Picker
    @State private var isAllowNotification = true
    enum PaymentMethods: String, CaseIterable, Identifiable {
        case Card, GooglePay, Cash, ApplePay
        var id: Self { self }
    }
    @State private var selectedMethod: PaymentMethods = .Cash
    
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.green)
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
            
            HStack{
                Text("Balance").font(.bold(.title)()).frame(width: 208, alignment: .leading)
                Text("---").font(.title).frame(width: 208, alignment: .trailing)
            }
            
            Text("Settings").font(.bold(.title)()).frame(width: 428, alignment: .leading).padding(1)
            NavigationLink(destination: UserProfile(), label: {
                Text("Profile").font(.title).frame(width: 428, alignment: .leading).foregroundColor(.black)
                }
            ).padding(1).onTapGesture {
                print("working")
            }
            
            HStack{
                Text("Payment Methods").font(.title).frame(width: 210, alignment: .leading)
                Picker("Payment Methods", selection: $selectedMethod) {
                    Text("Cash").tag(PaymentMethods.Cash).font(.largeTitle)
                    Text("Card").tag(PaymentMethods.Card).font(.largeTitle)
                    Text("Google Pay").tag(PaymentMethods.GooglePay).font(.largeTitle)
                    Text("Apple Pay").tag(PaymentMethods.ApplePay).font(.largeTitle)
                }.font(.largeTitle).frame(width: 210, alignment: .trailing)
            }
            
            ZStack{
                //DownToolBar
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: .infinity, height: 150)
                    .ignoresSafeArea()
                    .foregroundColor(.green)
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
            }.position(x: 214, y: 500)
        }.background(.gray)
    }
}

struct AppProfileMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppProfileMenu()
    }
}
