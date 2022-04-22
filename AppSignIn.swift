//
//  AppSignIn.swift
//  Delivery Service
//
//  Created by Admin on 20.04.2022.
//

import SwiftUI

struct AppSignIn: View {
    
    @State var EmailAdress: String = ""
    @State var Password: String = ""
    
    let typesOfMails = ["@mail.ru","@gmail.com","@yahoo.com"]
    
    @State var shouldTransit: Bool = false
    @State var flag: Bool = false
    
    let columns = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    @Environment(\.managedObjectContext) var  moc
    @FetchRequest(sortDescriptors: []) var UserData: FetchedResults<UserDataBase>
    
    func emptyChecker(){
        typesOfMails.forEach{
            if(EmailAdress.contains($0)){
                flag = true
            }
        }
    }
    
    func SignInChecker(){
//        for user in UserDataBase{
//            if user.emailAddress == EmailAdress && user.password == Password{
//                print("Welcome!")
//                break
//            }
//            else{
//                print("No User Found")
//            }
//        }
    }
    
    var body: some View {
        
        NavigationView{
            ZStack{
                
                Image("Sanzhik")
                    .resizable()
                    .ignoresSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 400)
                    .padding(.all)
                    .foregroundColor(.indigo)
                    .opacity(0.95)
                
                LazyVGrid(columns: columns){
                    
                    TextField("Your Email Adress", text: $EmailAdress)
                        .frame(height: 50)
                        .font(.title3)
                        .zIndex(2)
                        .border(.white.opacity(0.4))
                        .padding(.bottom)
                    
                    TextField("Your Password Here", text: $Password)
                        .frame(height: 50)
                        .font(.title3)
                        .zIndex(2)
                        .border(.white.opacity(0.4))
                    
                    HStack{
                        
                        NavigationLink(destination: Registration(), label: {
                            Text("Back To Registration")
                                .font(.title3)
                                .foregroundColor(.white)
                        }).padding(.trailing)
                        
                        NavigationLink(destination: AppMainMenu(), isActive: $flag, label: {
                            Text("Let's start!")
                                .font(.title3)
                                .onTapGesture {
                                    self.emptyChecker()
//                                    self.SignInChecker()
                            }.foregroundColor(.white)
                        }).padding(.leading)
                        
                    }.padding(.top)
                    
                }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Welcome back!!")
        }.navigationBarHidden(true)
    }
}

struct AppSignIn_Previews: PreviewProvider {
    static var previews: some View {
        AppSignIn()
    }
}
