//
//  SimpleListWidget.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 10/11/2025.
//

import SwiftUI

struct SimpleListWidget: View {
    let items = ["Apple", "Banana", "Cherry", "Date"]

    var body: some View {
        List(items, id: \.self) { item in
            Button(action: {
                print("Tapped \(item)")
            }) {
                // 3. Re-add standard padding INSIDE the clickable area
                HStack {
                    Text(item)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding(.horizontal, 20) // Standard side padding
                .padding(.vertical, 12)   // Comfortable row height
            }
            // 2. Apply custom style that fills available space
            .buttonStyle(FullWidthHighlightStyle())
            // 1. CRITICAL: Removes default List padding so button can touch edges
            .listRowInsets(EdgeInsets())
        }
        .listStyle(.plain) // Works best on Plain or Grouped styles
    }
}

struct FullWidthHighlightStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Makes the inner content fill the entire designated row area
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .contentShape(Rectangle())
            // The actual highlight effect
            .background(
                configuration.isPressed ? Color.gray.opacity(0.3) : Color.clear
            )
    }
}
#Preview {
    SimpleListWidget()
}
