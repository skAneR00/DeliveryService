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
        NavigationView{
        VStack{
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.init(Color.RGBColorSpace.sRGB, red: 0.51, green: 0.27, blue: 0.63, opacity: 1))
                    .frame(width: 428, height: 200)

                HStack{
                    Image(systemName: "person.crop.circle")
                        .resizable()
                        .frame(width: 100, height: 100)
                    VStack{
                        Text("Name SecondName").font(.title).padding()
                        Text("PhoneNumber").font(.title2)
                    }
                }
            }.position(x: 214, y: 0)
            
            HStack{
                Text("Balance").font(.bold(.title)()).frame(width: 208, alignment: .leading)
                Text("---").font(.title).frame(width: 208, alignment: .trailing)
            }.position(x: 214, y: 10)
            
            Text("Settings").font(.bold(.title)()).frame(width: 428, alignment: .leading).padding(1).position(x: 214, y: -60)
            NavigationLink(destination: UserProfile(), label: {
                Text("Profile").font(.title).frame(width: 428, alignment: .leading).foregroundColor(.black)
                }
            ).padding(1).onTapGesture {
                print("working")
            }.position(x: 214, y: -130)
            
            HStack{
                Text("Payment Methods").font(.title).frame(width: 300, alignment: .leading)
                Picker("Payment Methods", selection: $selectedMethod) {
                    Text("Cash").tag(PaymentMethods.Cash).font(.largeTitle)
                    Text("Card").tag(PaymentMethods.Card).font(.largeTitle)
                    Text("Google Pay").tag(PaymentMethods.GooglePay).font(.largeTitle)
                    Text("Apple Pay").tag(PaymentMethods.ApplePay).font(.largeTitle)
                }.font(.largeTitle).frame(width: 118, alignment: .trailing)
            }.position(x: 214, y: -210)
            
            Text("Promocodes").font(.title).frame(width: 420, alignment: .leading).position(x: 214, y: -280)
            
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
                    }.frame(width: 428, height: 100, alignment: .top)
                }.position(x: 214, y: 100)
            }.background(.white)
        }
    }
}

struct AppProfileMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppProfileMenu()
.previewInterfaceOrientation(.portrait)
    }
}
