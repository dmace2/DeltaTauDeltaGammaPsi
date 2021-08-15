//
//  BrotherExtendedInfoView.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/14/21.
//

import SwiftUI
import MapKit

struct BrotherExtendedInfoView: View {
    var brother: Brother
    
    init(brother: Brother) {
        self.brother = brother
    }
    
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).ignoresSafeArea()
            GeometryReader { geometry in
                VStack {
                    Image(systemName: "person.circle").resizable().frame(width: geometry.size.width / 3, height: geometry.size.width / 3)
                        .padding()
                    
                    List {
                        Section(header: HStack {
                            Image(systemName: "info.circle.fill")
                            Text("General Info").modifier(SectionLabel())
                        }) {
                            VStack(alignment: .leading) {
                                if brother.middle_name != nil {
                                    LabeledListRow<String>(label: "Name", content: "\(brother.first_name) \(brother.middle_name!) \(brother.last_name)")
                                } else {
                                    LabeledListRow<String>(label: "Name", content: "\(brother.first_name) \(brother.last_name)")
                                }
                                
                                if brother.hometown_state != nil {
                                    LabeledListRow<String>(label: "Hometown", content: "\(brother.hometown_city), \(brother.hometown_state!), \(brother.hometown_country)")
                                } else {
                                    LabeledListRow<String>(label: "Hometown", content: "\(brother.hometown_city), \(brother.hometown_country)")
                                }
//                                if brother.phone != nil {
//                                    LabeledListRow<Int>(label: "Phone", content: 2039694713)
//                                }
                                
                            }
                        }
                        
                        Section(header: HStack {
                            Image(systemName: "triangle.fill")
                            Text("Delt Info").modifier(SectionLabel())
                        }) {
                            VStack(alignment: .leading) {
                                LabeledListRow<String>(label: "Initiated", content: "\(brother.initiation_semester) \(brother.initiation_year)")
                                NavigationLink(destination: EmptyView()) {
                                    LabeledListRow<String>(label: "Greek Family", content: "View")
                                }
                            }
                        }
                        
                        
                        Section(header: HStack {
                            Image(systemName: "books.vertical.fill")
                            Text("Academic Info").modifier(SectionLabel())
                        }) {
                            VStack(alignment: .leading) {
                                LabeledListRow<String>(label: "Major", content: brother.major)
                                if brother.planned_grad_year != nil && brother.planned_grad_semester != nil {
                                    LabeledListRow(label: "Planned Graduation", content: "\(brother.planned_grad_semester!) \(brother.planned_grad_year!)")
                                    
                                }
                                
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    
                    
                    
                    Spacer()
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height,
                       alignment: .center) // alignment here should function as expected.
            }
        }
        
        
        .navigationTitle(Text(verbatim: "\(brother.i)").font(.system(size: 30, weight: .heavy, design: .default)))
        
    }
}
