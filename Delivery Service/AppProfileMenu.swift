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
    
    
    let items = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    var body: some View {
        NavigationView{
            ScrollView {
                LazyVGrid(columns: items){
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.indigo)
                            .frame(width: 428, height: 200).opacity(0.9)

                        HStack{
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 100, height: 100)
                            VStack{
                                Text("\(UserRegistration.UserName) \(UserRegistration.UserSecondName)").font(.title).padding()
                                Text("Phone Number: \(UserRegistration.UserPhoneNumber)").font(.title2)
                            }
                        }
                    }
                    Text("Balance").font(.bold(.title)()).frame(width: 428, alignment: .leading)
                    HStack{
                        Text("Balance").font(.title).frame(width: 210, alignment: .leading)
                        Text("---").font(.title).frame(width: 210, alignment: .trailing)
                    }.padding(0.5)
                    HStack{
                        Text("Bonuses").font(.title).frame(width: 210, alignment: .leading)
                        Text("---").font(.title).frame(width: 210, alignment: .trailing)
                    }
                    Text("Settings").font(.bold(.title)()).frame(width: 428, alignment: .leading).padding(1)
                    NavigationLink(destination: UserProfile(), label: {
                        Text("Profile").font(.title).frame(width: 428, alignment: .leading).foregroundColor(.black)
                        }
                    ).padding(1).onTapGesture {
                        print("working")
                    }
                    HStack{
                        Text("Payment Methods").font(.title).frame(width: 300, alignment: .leading)
                        Picker("Payment Methods", selection: $selectedMethod) {
                            Text("Cash").tag(PaymentMethods.Cash).font(.largeTitle)
                            Text("Card").tag(PaymentMethods.Card).font(.largeTitle)
                            Text("Google Pay").tag(PaymentMethods.GooglePay).font(.largeTitle)
                            Text("Apple Pay").tag(PaymentMethods.ApplePay).font(.largeTitle)
                        }.font(.largeTitle).frame(width: 118, alignment: .trailing)
                    }
                    
                    Text("Promocodes").font(.title).frame(width: 420, alignment: .leading)
                    
                    
                    
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
                            })
                            NavigationLink(destination: AppShopsMenu(), label: {
                                Image(systemName: "cart")
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }).colorMultiply(.black)
                            Image(systemName: "person.crop.circle")
                                .resizable()
                                .frame(width: 50, height: 50)
                            }.frame(width: 428, height: 100, alignment: .top)
                    }.position(x: 214, y: 250)
                }
            }.navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Profile")
        }.navigationBarHidden(true)
    }
}

struct AppProfileMenu_Previews: PreviewProvider {
    static var previews: some View {
        AppProfileMenu()
.previewInterfaceOrientation(.portrait)
    }
}
