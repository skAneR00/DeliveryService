//
//  AppRestaurantInfo.swift
//  Delivery Service
//
//  Created by Admin on 22.04.2022.
//

import SwiftUI

struct AppRestaurantInfo: View {
    
    let columns = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    let raiting : Double = 10.0
    let deliveryCost = 200
    
    var body: some View {
        NavigationView{
            HStack{
                    ScrollView{
                        Image("\(AppMainMenu.ItemChecker)")
                            .resizable()
                            .frame(width: 400, height: 300, alignment: .center)
                            .cornerRadius(10)
                        VStack{
                            Text("\(AppMainMenu.ItemChecker)").font(.title3)
                            HStack(spacing: 10){
                                Text("Delivery cost: \(deliveryCost)")
                                Text("Raiting: \(NSString(format:"%.2f", raiting))")
                            }
                        }.padding(.vertical)
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.black, lineWidth: 3)
//                                .shadow(color: .black, radius: 50)
                                .padding(.horizontal)
                            Text("Description")
                                .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
                                .font(.title3)
                                .padding(.horizontal)
                        }
                        .padding(.vertical)
                        Text("Restaurant's menu: ")
                            .padding(.horizontal)
                            .padding(.vertical)
                            .font(.title2)
                        
                        
                        Text("Something New")
                            .padding(.top)
                            .font(.title2)
                        
                        
                        VStack(spacing: 5){
                            HStack{
                                VStack{
                                    Text("Big Tasty Roll").font(.title3)
                                    Text("Two natural piece of meat inside bread")
                                }
                                Image("food")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(15)
                            }.frame(width: 428).border(.black.opacity(0.4))
                            HStack{
                                VStack{
                                    Text("Big Tasty Roll").font(.title3)
                                    Text("Two natural piece of meat inside bread")
                                }
                                Image("food")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(15)
                            }.frame(width: 428).border(.black.opacity(0.4))
                            HStack{
                                VStack{
                                    Text("Big Tasty Roll").font(.title3)
                                    Text("Two natural piece of meat inside bread")
                                }
                                Image("food")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(15)
                            }.frame(width: 428).border(.black.opacity(0.4))
                        }
                        
                        
                        Text("McCombo")
                            .padding(.top)
                            .font(.title2)
                        VStack(spacing: 5){
                            HStack{
                                VStack{
                                    Text("McCombo Chicken").font(.title3)
                                    Text("Two natural piece of meat inside bread")
                                }
                                Image("food")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(15)
                            }.frame(width: 428).border(.black.opacity(0.4))
                            HStack{
                                VStack{
                                    Text("McCombo Cheeseburger").font(.title3)
                                    Text("Two natural piece of meat inside bread")
                                }
                                Image("food")
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .cornerRadius(15)
                            }.frame(width: 428).border(.black.opacity(0.4))
                        }
                }
            }
            .navigationTitle("Info")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AppRestaurantInfo_Previews: PreviewProvider {
    static var previews: some View {
        AppRestaurantInfo()
    }
}
