//
//  SetUpContentView.swift
//  checkIn
//
//  Created by Alex Yeh on 2022-10-02.
//

import SwiftUI

struct SetUpContentView: View {
    @State var clinicID = ""
    @State var presentCovidDeclarationPage = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(alignment: .center) {
            Text("Setup with the Unique Clinic Identifier").font(.title2)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Clinic ID", text: $clinicID)
            }
            .textFieldStyle(.roundedBorder)
            HStack {
                Spacer()
                Button {
                    UserDefaults.standard.set(clinicID, forKey: "clinic_id")
                    presentCovidDeclarationPage = true
                } label: {
                    Label("Connect", systemImage: "arrow.right")
                        .sheet(isPresented: $presentCovidDeclarationPage, onDismiss: nil) {
                            
                        }
                }.sheet(isPresented: $presentCovidDeclarationPage) {
                    presentationMode.wrappedValue.dismiss()
                } content: {
                    CovidDeclarationContentView(viewModel: ViewModel(hashKey: clinicID))
                }
            }
        }.padding()
    }
}

struct SetUpContentView_Previews: PreviewProvider {
    static var previews: some View {
        SetUpContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
