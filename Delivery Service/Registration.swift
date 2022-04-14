//
//  Registration.swift
//  Delivery Service
//
//  Created by Admin on 24.02.2022.
//

import SwiftUI

struct Registration: View {
    var body: some View {
        NumberRegistration()        
    }
}

struct Registration_Previews: PreviewProvider {
    static var previews: some View {
        Registration()
    }
}



struct NumberRegistration : View{
    
    @State var PhoneNumber: String = ""
    
    @Environment(\.managedObjectContext) var  moc
    @FetchRequest(sortDescriptors: []) var UserDatabase: FetchedResults<UserDataBase>
    
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
    
    
    var body: some View {
        NavigationView{
        ZStack{
            Image("Sanzhik").resizable().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity).edgesIgnoringSafeArea(.all)
            Text("Enter your number for start").position(x: 150,y: 650).zIndex(2).font(.title2)
            TextField("Your Phone Number", text: $PhoneNumber).frame(minWidth: 300, maxWidth: 428, minHeight: 80, maxHeight: 80).position(x: 240, y: 700).zIndex(2).font(.title2)
            RoundedRectangle(cornerRadius: 10).frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 200, maxHeight: 250).foregroundColor(Color.white).zIndex(1).opacity(0.95).position(x: 215, y: 730)
            NavigationLink(destination: EmailRegistration(), label: {
                Text("Continue").font(.title2)
            }).position(x: 214, y: 770).zIndex(2)
            }.navigationBarTitleDisplayMode(.inline)
        }.navigationBarHidden(true)
    }
}


struct EmailRegistration : View{
    
    @State var EmailAdress: String = ""
    let typesOfMails = ["@mail.ru","@gmail.com","@yahoo.com"]
    let columns = [GridItem(.adaptive(minimum: 214, maximum: 428))]
    
    func emptyChecker(){
        typesOfMails.forEach{
            if(EmailAdress.contains($0)){
                print("Succes!!")
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
                    NavigationLink(destination: InitialsRegistration(), label: {
                        Text("Continue").font(.title2)
                    }).zIndex(2).padding(.leading)
                    Button("Click me pls"){
                        emptyChecker()
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
                    NavigationLink(destination: AppMainMenu(), label: {
                        Text("Continue").font(.title2)
                    }).zIndex(2).padding(.leading)
                }.frame(width: 428).position(x: 214, y: 770).zIndex(2)
            }.navigationBarTitleDisplayMode(.inline)
        }.navigationBarHidden(true)
    }
}
