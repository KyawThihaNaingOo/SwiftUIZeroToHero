//
//  GridViewDynaimcWidget.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 11/11/2025.
//

import SwiftUI

struct GridViewDynaimcWidget: View {
    //    @State private var items: Array<String> = [
    //        "A", "B", "C", "D"
    //    ]
    var body: some View {
        // 1. Define your column layout
//        let columns: [GridItem] = [
//            GridItem(.adaptive(minimum: 100)) // Fit as many columns as possible
//            // with a minimum width of 100 points
//        ]
//        
//        let rows: [GridItem] = [
//            GridItem(.adaptive(minimum: 100, maximum: 100)),
//        ]
//        
        // 2. Create the grid inside a ScrollView
//        ScrollView(.horizontal) {
//            /// LazyVGrid // column
//            /// LazyHGrid // row
//            LazyHGrid(rows: rows, spacing: 20) {
//                //                ForEach(items, id: \.self) { item in
//                //                    Text("Item \(item)")
//                //                        .padding()
//                //                        .background(Color.gray.opacity(0.3))
//                //                        .cornerRadius(8)
//                // }
//                ForEach(0..<100000) { index in
//                    Text("Item \(index)")
//                        .padding()
//                        .background(Color.gray.opacity(0.3))
//                        .cornerRadius(8)
//                }
//            }
//            .padding()
//        }
        
//        ScrollView(.horizontal) {
//            LazyHGrid(rows: [
//                GridItem(.fixed(100)),
////                GridItem(.flexible(minimum: 50, maximum: .infinity)),
////                GridItem(.flexible(minimum: 50, maximum: .infinity)),
////                GridItem(.flexible(minimum: 50, maximum: .infinity))
//            ], alignment: .top, spacing: 10) {
//                ForEach(0..<1000, id: \.self) { column in
//                    Text("\(column)")
//                        .frame(width: 100)
//                        .frame(maxHeight: .infinity)
//                        .background(Color.gray.opacity(0.2))
//                        .border(Color.gray)
//                }
//            }.padding()
//        }
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.adaptive(minimum: 100, maximum: 100))
            ], alignment: .leading) {
                ForEach(0..<1000, id: \.self) { column in
                    Text("\(column)")
                        .frame(width: 100, height: 100)
                        .frame(maxHeight: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .border(Color.gray)
                }
            }
        }.padding()
    }
}

#Preview {
    GridViewDynaimcWidget()
}
