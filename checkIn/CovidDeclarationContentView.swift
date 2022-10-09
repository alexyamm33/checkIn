//
//  CovidDeclarationContentView.swift
//  checkIn
//
//  Created by Alex Yeh on 2022-10-01.
//

import SwiftUI

struct CovidDeclarationContentView: View {
    @ObservedObject var viewModel: ViewModel
    @State var presentScannerPage = false
    @State var presentNoOHIPPage = false
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Toggle(isOn: Binding(get: {
                    viewModel.model.pateint.hasCovidSymptoms
                }, set: {
                    viewModel.model.pateint.hasCovidSymptoms = $0
                })) {
                    Text("Are you experiencing Covid-like symptoms?")
                }
                Spacer()
            }
            HStack {
                Spacer()
                Toggle(isOn: Binding(get: {
                    viewModel.model.pateint.hasOHIP
                }, set: {
                    viewModel.model.pateint.hasOHIP = $0
                })) {
                    Text("Do you have your green OHIP card?")
                }
                Spacer()
            }
            VStack(alignment: .trailing) {
                Button {
                    if viewModel.model.pateint.hasOHIP {
                        presentScannerPage = true
                    } else {
                        presentNoOHIPPage = true
                    }
                } label: {
                    Text("Continue")
                }.sheet(isPresented: $presentScannerPage) {
                    presentationMode.wrappedValue.dismiss()
                } content: {
                    
                }.sheet(isPresented: $presentNoOHIPPage) {
                    presentationMode.wrappedValue.dismiss()
                } content: {
                    NoOhipContentView()
                }



            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CovidDeclarationContentView(viewModel: ViewModel(hashKey: ""))
.previewInterfaceOrientation(.landscapeLeft)
    }
}
