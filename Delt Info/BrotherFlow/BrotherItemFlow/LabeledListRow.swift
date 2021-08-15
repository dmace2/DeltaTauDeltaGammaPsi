//
//  TextLabel.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/14/21.
//

import SwiftUI

struct LabeledListRow<T>: View {
    var label: String
    var content: T
    
    var body: some View {
        HStack {
            Text("\(label):").bold()
            Spacer()
            Text(verbatim: "\(content)")
        }
        .padding(3)
    }
}
