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
        ZStack{
            Image("RegistrationBackground").resizable().frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: .infinity).edgesIgnoringSafeArea(.all)
            Text("Enter your number for start").position(x: 150,y: 700).zIndex(2).font(.title2)
            TextField("Your Phone Number", text: $PhoneNumber).frame(minWidth: 300, maxWidth: .infinity, minHeight: 80, maxHeight: 80).position(x: 240, y: 750).zIndex(2).font(.title2)
            RoundedRectangle(cornerRadius: 10).frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 0, idealHeight: 200, maxHeight: 250).foregroundColor(Color.cyan).zIndex(1).opacity(0.95).position(x: 215, y: 760)
            Button("Continue"){
                print(formatPhoneNumber(number: PhoneNumber))
            }.zIndex(2).position(x: 214, y: 800).font(.title2)
        }
    }
}






struct EmailRegistration : View{
    var body: some View{
        Text("Hi")
    }
}
