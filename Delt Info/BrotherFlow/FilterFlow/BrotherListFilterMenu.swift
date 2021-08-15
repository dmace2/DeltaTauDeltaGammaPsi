//
//  BrotherListFilterMenu.swift
//  Delt Info
//
//  Created by Dylan Mace on 8/15/21.
//

import SwiftUI

struct BrotherListFilterMenu: View {
    @EnvironmentObject var brotherListModel: BrotherListModel
    @Environment(\.presentationMode) var presentationMode
    
    
    var columns: [GridItem] =
             Array(repeating: .init(.flexible()), count: 2)

    
    var body: some View {
        ZStack {
            Color(.secondarySystemBackground).ignoresSafeArea()
            VStack(alignment: .leading) {
                List {
                    Section(header: Text("Sorting").modifier(SectionLabel())) {
                        HStack {
                            Label("Sort By", systemImage: "arrow.up.arrow.down.circle.fill")
                            Spacer()
                            Menu {
                                ForEach(brotherListModel.sortOptions, id: \.self) { option in
                                    Button {
                                        brotherListModel.sortby = option
                                    } label: {
                                        Label(option, systemImage: "person.circle")
                                    }
                                }
                            } label: {
                                Text($brotherListModel.sortby.wrappedValue)
                            }
                        }
                        HStack {
                            Toggle("Sort Descending", isOn: $brotherListModel.descending)
                        }
                    }
                    
                    Section(header: Text("Filter").modifier(SectionLabel())) {
                        HStack {
                            Label("Major", systemImage: "books.vertical.fill")
                            Spacer()
                            Menu {
                                ForEach(brotherListModel.majors, id: \.self) { option in
                                    Button {
                                        brotherListModel.major = option
                                        print(presentationMode)
                                    } label: {
                                        Label(option, systemImage: "books.vertical.fill")
                                    }
                                }
                            } label: {
                                Text($brotherListModel.major.wrappedValue)
                            }
                        }
                        
                        HStack {
                            Label("Pledge Class Year", systemImage: "clock.fill")
                            Spacer()
                            Menu {
                                ForEach(brotherListModel.pcYears, id: \.self) { option in
                                    Button {
                                        brotherListModel.pcYear = option
                                    } label: {
                                        Label(option, systemImage: "clock.fill")
                                    }
                                }
                            } label: {
                                Text($brotherListModel.pcYear.wrappedValue)
                            }
                        }
                        HStack {
                            Label("Pledge Class Semester", systemImage: "clock.fill")
                            Spacer()
                            Menu {
                                ForEach(brotherListModel.pcSemesters, id: \.self) { option in
                                    Button {
                                        brotherListModel.pcSem = option
                                    } label: {
                                        Label(option, systemImage: "clock.fill")
                                    }
                                }
                            } label: {
                                Text($brotherListModel.pcSem.wrappedValue)
                            }
                        }
                        HStack {
                            Label("Hometown State", systemImage: "mappin.circle.fill")
                            Spacer()
                            Menu {
                                ForEach(brotherListModel.hometownStates, id: \.self) { option in
                                    Button {
                                        brotherListModel.state = option
                                    } label: {
                                        Label(option, systemImage: "mappin.circle.fill")
                                    }
                                }
                            } label: {
                                Text($brotherListModel.state.wrappedValue)
                            }
                        }
                    }
                }
                .listStyle(InsetGroupedListStyle())
                Spacer()
                Button("Apply") {
                    brotherListModel.updateBrotherList()
                    presentationMode.wrappedValue.dismiss()
                }
                .modifier(SortButtonStyle())
                .padding()
            }
        }
        .onAppear() {
            brotherListModel.getFilters()
        }
        .navigationTitle("Sorting & Filters")
    }
}

//struct BrotherListFilterMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        BrotherListFilterMenu()
//    }
//}
