//
//  MapExtension.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/14/21.
//

import Foundation
import SwiftUI


struct SectionLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15, weight: .heavy, design: .default))
    }
}

struct SortButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 20, maxHeight: 40)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .padding(3)
    }
}

