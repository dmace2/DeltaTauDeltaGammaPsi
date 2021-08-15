//
//  BrotherListItemView.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/14/21.
//

import SwiftUI


struct BrotherListItemView: View {
    var brother: Brother
    
    init(_ brother: Brother) {
        self.brother = brother
//        self.brother.hometown_state = "CT"
    }
    
    @ViewBuilder
    var body: some View {
        VStack(alignment: .leading) {
            Text(verbatim: "\(brother.i)").font(.system(size: 30, weight: .heavy, design: .default))
            Text("\(brother.first_name) \(brother.last_name)").font(.title)
            if brother.hometown_state != nil {
                Text("\(brother.hometown_city), \(brother.hometown_state ?? "None")")
            } else {
                Text("\(brother.hometown_city), \(brother.hometown_country)")
            }
        }
        .padding()
    }
}
