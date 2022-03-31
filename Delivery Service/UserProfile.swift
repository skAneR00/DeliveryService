//
//  UserProfile.swift
//  Delivery Service
//
//  Created by Admin on 24.03.2022.
//

import SwiftUI

struct UserProfile: View {
    var url: String = "https://www.google.ru"
    @State private var isAllowNotification = true
    enum Country: String, CaseIterable, Identifiable {
        case Kazakhstan, Russia, Ukraine
        var id: Self { self }
    }
    @State private var selectedCountry: Country = .Kazakhstan
    var body: some View {
        VStack{
            Text("Profile").font(.bold(.title)()).frame(width: 428, alignment: .leading).padding(2)
            HStack{
                Text("Change Country").font(.title).frame(width: 210, alignment: .leading)
                Picker("Change country", selection: $selectedCountry) {
                    Text("Kazakhstan").tag(Country.Kazakhstan).font(.largeTitle)
                    Text("Russia").tag(Country.Russia).font(.largeTitle)
                    Text("Ukraine").tag(Country.Ukraine).font(.largeTitle)
                }.font(.largeTitle).frame(width: 210, alignment: .trailing)
            }
            Text("Change Number").font(.title).frame(width: 428, alignment: .leading)
            Toggle("Allow Notification", isOn: $isAllowNotification).font(.title).padding(1)
            Text("Legal Information").font(.bold(.title)()).frame(width: 428, alignment: .leading).padding(2)
            Text("Terms of use").font(.title).frame(width: 428, alignment: .leading).padding(1).onTapGesture {
                if let url = URL(string: "https://www.google.ru") {
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)
                        }
            }
            Text("About Us").font(.bold(.title)()).frame(width: 428, alignment: .leading).padding(2)
            HStack{
                Text("Version").font(.title).frame(width: 210, alignment:   .leading).padding(1)
                Text("0.0.1").font(.title).frame(width: 210, alignment: .trailing)
            }
            Text("Quit").font(.title).frame(width: 428, alignment: .leading).onTapGesture {
                print("Succeful")
            }
            Spacer()
        }.background(.white)
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
