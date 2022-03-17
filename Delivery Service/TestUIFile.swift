//
//  TestUIFile.swift
//  Delivery Service
//
//  Created by Admin on 27.02.2022.
//

import SwiftUI

struct TestUIFile: View {
    @Environment(\.managedObjectContext) var  moc
    @FetchRequest(sortDescriptors: []) var UserDatabase: FetchedResults<UserDataBase>
    @State var PhoneNumber: String = ""
    
    
    func formatPhoneNumber(number: String) -> String{
        let mask = "+# (###) ###-##-##"
        var result = ""
        var count = 0
        
        for var num in mask{
            
            if num == "#"{
                num = number[number.index(number.startIndex, offsetBy: count)]
                count += 1
            }
            result.append(num)
        }
        
        return result
    }
    
    var body: some View {
        VStack{
            TextField("PhoneNumber", text: $PhoneNumber).keyboardType(.numberPad).frame(height: 300).background(.green)
            Button("Click"){
                if PhoneNumber.count == 11{
                    print(formatPhoneNumber(number: PhoneNumber))
                }
                else{
                    print("Error")
                }
            }
        }
    }
}

struct TestUIFile_Previews: PreviewProvider {
    static var previews: some View {
        TestUIFile()
    }
}
