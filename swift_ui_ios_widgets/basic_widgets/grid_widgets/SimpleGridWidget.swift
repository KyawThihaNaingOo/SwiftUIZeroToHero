//
//  SimpleGridWidget.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 11/11/2025.
//

import SwiftUI

struct SimpleGridWidget: View {
    var body: some View {
        Grid(horizontalSpacing: 10) {
            GridRow {
                Text("Row 1, Cell 1")
                Text("Row 1, Cell 2")
            }
            
            // This view spans 2 columns
            Text("This spans the whole width")
                .gridCellColumns(2) // Spans 2 columns
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity(0.2))
            
            GridRow {
                Text("Row 3, Cell 1")
                Text("Row 3, Cell 2")
            }
        }
        .padding()
    }
}

#Preview {
    SimpleGridWidget()
}
