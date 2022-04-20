//
//  Registration.swift
//  Delivery Service
//
//  Created by Admin on 24.02.2022.
//

import SwiftUI

struct Registration: View {
    var body: some View {
        UserRegistration()
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}


struct NumberRegistration : View{
    
    @State var PhoneNumber: String = ""
    @State private var shouldTransit: Bool = false
    
    
    @Environment(\.managedObjectContext) var  moc
    @FetchRequest(sortDescriptors: []) var UserData: FetchedResults<UserDataBase>
    
    func formatPhoneNumber(number: String) -> String{
        let mask = "+# (###) ###-##-##"
        var result = ""
        var count = 0
        
        for var num in mask{
            
            if num == "#" && number.count == 11{
                num = number[number.index(number.startIndex, offsetBy: count)]
                count += 1
            }
            else{
                print("Count error")
            }
            result.append(num)
        }
        
        return result
    }
    
    func registerNewUser() {
        print("Succeful!")
        do{
            let user = UserDataBase(context: moc)
            if PhoneNumber != "" {
                user.phonenumber = formatPhoneNumber(number: PhoneNumber)
                user.id = UUID()
                print(user.phonenumber ?? "Unknow", user.id ?? "Unknow")
                try moc.save()
            }
            else{
                print("Error - PhoneNumber")
            }
        }catch{
            print(error)
        }
    }
    
    
    var body: some View {
        NavigationView{
        ZStack{
            Image("Sanhik").resizable().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity).edgesIgnoringSafeArea(.all)
            Text("Enter your number for start").position(x: 150,y: 650).zIndex(2).font(.title2)
            TextField("Your Phone Number", text: $PhoneNumber).frame(minWidth: 300, maxWidth: 428, minHeight: 80, maxHeight: 80).position(x: 240, y: 700).zIndex(2).font(.title2)
            RoundedRectangle(cornerRadius: 10).frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 200, maxHeight: 250).foregroundColor(Color.white).zIndex(1).opacity(0.95).position(x: 215, y: 730)
            if PhoneNumber.count == 11{
                NavigationLink(destination: EmailRegistration(), isActive: $shouldTransit, label: {
                    Text("Continue").font(.title2).onTapGesture {
                        print("Saved")
//                        self.registerNewUser()
                        self.shouldTransit = true
                    }
                }).position(x: 214, y: 770).zIndex(2)
            }
            }.navigationBarTitleDisplayMode(.inline)
        }.navigationBarHidden(true)
    }
}


struct EmailRegistration : View{
    
    @State var EmailAdress: String = ""
    @State var flag: Bool!
    @State private var shouldTransit: Bool = false
    
    let typesOfMails = ["@mail.ru","@gmail.com","@yahoo.com"]
    
    let columns = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    
    @Environment(\.managedObjectContext) var  moc
    @FetchRequest(sortDescriptors: []) var UserData: FetchedResults<UserDataBase>
    
    func registerNewUser() {
        print("Succeful!")
        do{
            let user = UserDataBase(context: moc)
            if EmailAdress != "" {
                user.email = EmailAdress
                print(user.email ?? "Unknow", user.id ?? "Unknow")
                try moc.save()
            }
            else{
                print("Error - PhoneNumber")
            }
        }catch{
            print(error)
        }
    }
    
    func emptyChecker(){
        typesOfMails.forEach{
            if(EmailAdress.contains($0)){
                flag = true
            }
        }
    }
    
    var body: some View{
        NavigationView{
            ZStack{
                Image("Sanzhik").resizable().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity).edgesIgnoringSafeArea(.all)
                Text("Enter your email").position(x: 100,y: 650).zIndex(2).font(.title2)
                TextField("Your Email Adress", text: $EmailAdress).frame(minWidth: 300, maxWidth: 428, minHeight: 80, maxHeight: 80).position(x: 240, y: 700).zIndex(2).font(.title2)
                RoundedRectangle(cornerRadius: 10)
                    .frame(minWidth: 0, maxWidth: 428, minHeight: 0, maxHeight:   250)
                    .foregroundColor(Color.white)
                    .zIndex(1)
                    .opacity(0.95)
                    .position(x: 215, y: 730)
                HStack{
                    NavigationLink(destination: NumberRegistration(), label: {
                        Text("Back").font(.title2)
                    }).zIndex(2).padding(.trailing)
                    if flag == true{
                        NavigationLink(destination: InitialsRegistration(),isActive: $shouldTransit, label: {
                            Text("Continue").font(.title2).onTapGesture {
//                                self.registerNewUser()
                                self.shouldTransit = true
                            }
                        }).zIndex(2).padding(.leading)
                    }
                    else{
                        Button("Continue"){
                            emptyChecker()
                        }.zIndex(2).padding(.leading).font(.title2)
                    }
                }.frame(width: 428).position(x: 214, y: 770).zIndex(2)
                
            }.navigationBarTitleDisplayMode(.inline)
        }.navigationBarHidden(true)
    }
}


struct InitialsRegistration : View{
    @State var FirstName: String = ""
    @State var SecondName: String = ""
    let columns = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    var body: some View{
        NavigationView{
            ZStack{
                Image("Sanzhik").resizable().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity).edgesIgnoringSafeArea(.all)
                Text("Enter your initials").position(x: 100,y: 630).zIndex(2).font(.title2)
                TextField("Your First Name", text: $FirstName).frame(minWidth: 300, maxWidth: 428, maxHeight: 80).position(x: 240, y: 670).zIndex(2).font(.title2)
                TextField("Your Second Name", text: $SecondName).frame(minWidth: 300, maxWidth: 428, maxHeight: 80).position(x: 240, y: 720).zIndex(2).font(.title2)
                RoundedRectangle(cornerRadius: 10).frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 200, maxHeight: 250).foregroundColor(Color.white).zIndex(1).opacity(0.95).position(x: 215, y: 730)
                HStack{
                    NavigationLink(destination: EmailRegistration(), label: {
                        Text("Back").font(.title2)
                    }).zIndex(2).padding(.trailing)
                    if FirstName.count > 1 && SecondName.count > 1{
                        NavigationLink(destination: AppMainMenu(), label: {
                            Text("Continue").font(.title2)
                        }).zIndex(2).padding(.leading)
                    }
                }.frame(width: 428).position(x: 214, y: 770).zIndex(2)
            }.navigationBarTitleDisplayMode(.inline)
        }.navigationBarHidden(true)
    }
}


struct UserRegistration : View{
    
    @State var PhoneNumber: String = ""
    @State var EmailAdress: String = ""
    @State var FirstName: String = ""
    @State var SecondName: String = ""
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
    
    func RegistrationChecker(){
        if PhoneNumber.count == 11 && flag == true &&
            FirstName.count > 1 && SecondName.count > 1{
            
            shouldTransit = true
            
            do{
                let user = UserDataBase(context: moc)
                if PhoneNumber.count == 11 && flag == true &&
                    FirstName.count > 1 && SecondName.count > 1{
                    
                    user.email = EmailAdress
                    user.phonenumber = PhoneNumber
                    user.firstname = FirstName
                    user.lastname = SecondName
                    user.id = UUID()
                    user.userrole = ""
                    user.balance = 0
                    print(user.email ?? "Unknow",
                          user.id ?? "Unknow",
                          user.phonenumber ?? "Unknow",
                          user.firstname ?? "Unknow",
                          user.lastname ?? "Unknow",
                          user.balance)
                    try moc.save()
                }
                else{
                    print("Error - PhoneNumber")
                }
            }catch{
                print(error)
            }
        }
    }
    
    
    
    var body: some View{
        NavigationView{
            ZStack{
                
                Image("RegistrationBackground")
                    .resizable()
                    .ignoresSafeArea(.all)
                
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 400)
                    .padding(.all)
                    .foregroundColor(.indigo)
                    .opacity(0.95)
                
                LazyVGrid(columns: columns){
                    
                    TextField("Your Phone Number", text: $PhoneNumber)
                        .frame(height: 50)
                        .font(.title3)
                        .zIndex(2)
                        .border(.white.opacity(0.4))
                        .foregroundColor(.white)
                    
                    TextField("Your Email Adress", text: $EmailAdress)
                        .frame(height: 50)
                        .font(.title3)
                        .zIndex(2)
                        .border(.white.opacity(0.4))
                        .foregroundColor(.white)
                    
                    TextField("Your Name", text: $FirstName)
                        .frame(height: 50)
                        .font(.title3)
                        .zIndex(2)
                        .border(.white.opacity(0.4))
                        .foregroundColor(.white)
                    
                    TextField("Your Second Name", text: $SecondName)
                        .frame(height: 50)
                        .font(.title3)
                        .zIndex(2)
                        .border(.white.opacity(0.4))
                        .foregroundColor(.white)
                    
                    TextField("Your Password Here", text: $Password)
                        .frame(height: 50)
                        .font(.title3)
                        .zIndex(2)
                        .border(.white.opacity(0.4))
                        .foregroundColor(.white)
                    
                    HStack{
                        
                        NavigationLink(destination: AppSignIn(), label: {
                            Text("I'm already registered!").font(.title3).foregroundColor(.white)
                        }).padding(.trailing)
                        
                        NavigationLink(destination: AppMainMenu(), isActive: $shouldTransit, label: {
                            Text("Let's start!").font(.title3).onTapGesture {
                                self.emptyChecker()
                                self.RegistrationChecker()
                            }.foregroundColor(.white)
                        }).padding(.leading)
                    }
                }.padding(.init(top: 0, leading: 20, bottom: 0, trailing: 20))
            }.navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Welcome!!")
        }.navigationBarHidden(true)
    }
}
