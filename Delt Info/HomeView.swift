//
//  ContentView.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/14/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            BrotherListView()
        }
        .navigationTitle("Home")
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
