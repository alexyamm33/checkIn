//
//  checkInApp.swift
//  checkIn
//
//  Created by Alex Yeh on 2022-10-01.
//

import SwiftUI

@main
struct checkInApp: App {
    var body: some Scene {
        WindowGroup {
            if let clinicID =  UserDefaults.standard.string(forKey: "clinic_id") {
                CovidDeclarationContentView(viewModel: ViewModel(hashKey: clinicID))
            } else {
                SetUpContentView()
            }

        }
    }
}

struct Previews_checkInApp_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
