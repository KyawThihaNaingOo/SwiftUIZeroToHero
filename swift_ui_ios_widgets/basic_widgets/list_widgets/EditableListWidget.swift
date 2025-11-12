//
//  EditableListWidget.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 10/11/2025.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.1 : 1.0) // Scale up when pressed
            .opacity(configuration.isPressed ? 0.8 : 1.0)    // Dim opacity when pressed
            .animation(.easeOut(duration: 0.1), value: configuration.isPressed) // Animate changes
    }
}

struct EditableList: View {
    @State private var items = ["A", "B", "C"]
    
    var body: some View {
        VStack {
            List {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text(item)
                        Spacer()
                    }
                }
                .onDelete { indexSet in
                    items.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
        }
        
    }
}


#Preview {
    EditableList()
}
