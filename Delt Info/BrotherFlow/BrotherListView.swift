//
//  BrotherListView.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/14/21.
//

import SwiftUI



struct BrotherListView: View {
    @ObservedObject var brotherListModel = BrotherListModel()
    @Environment(\.presentationMode) var presentationMode
    @State private var showFilterUI = false
    
    
    var body: some View {
        List(brotherListModel.brothers, id:\.i) {brother in
            NavigationLink(destination: BrotherExtendedInfoView(brother: brother)) {
                BrotherListItemView(brother)
            }
            
        }
//        .onAppear() {
//            brotherListModel.getAllBrothers()
//        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button("Filter") {
                    showFilterUI = true
                }
                .sheet(isPresented: $showFilterUI) {
                    NavigationView {
                        BrotherListFilterMenu().environmentObject(brotherListModel)
                    }
                   
                }
            }
        }
        .navigationTitle("Brothers")
    }
}

struct BrotherListView_Previews: PreviewProvider {
    static var previews: some View {
        BrotherListView()
    }
}
