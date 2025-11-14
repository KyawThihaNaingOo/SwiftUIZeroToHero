//
//  ContentView.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 14/11/2025.
//


import SwiftUI

struct TabBarViewWidget: View {
    // This state variable tracks which tab is selected.
    // We set it to "browse" so it's the default.
    @State private var selectedTab = "browse"
    @State private var isBTEnable = false
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "clock") {
                VStack {
                    Text("Recent")
                    Toggle("Bluetooth", isOn: $isBTEnable)
                }.padding()
            }
            
            Tab("Shared", systemImage: "folder.badge.person.crop") {
                List {
                    ForEach(0..<1000, id: \.self) { column in
                        Text("Row \(column)")
                    }
                }
            }
            Tab("Broweser", systemImage: "folder") {
                BrowseView()
            }
        }
    }
}

struct BrowseView: View {
    // State for the search bar text
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                // Spacers push the content to the vertical center
                Spacer()
                
                // Centered content
                VStack(spacing: 12) {
                    Image(systemName: "iphone")
                        .font(.system(size: 60)) // Large icon
                        .foregroundStyle(.secondary) // Gray color
                    
                    Text("On My iPhone is Empty")
                        .font(.title3)
                        .fontWeight(.bold)
                }
                
                Spacer()
            }
            .padding()
            // Adds the search bar under the title
            .searchable(text: $searchText, prompt: "Search")
            // Sets the navigation bar title
            .navigationTitle("On My iPhone")
            .navigationBarTitleDisplayMode(.inline) // Makes the title small and centered
            // Adds the navigation bar buttons
            .toolbar {
                // Back button (leading)
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        // Action for back button
                    }) {
                        Image(systemName: "chevron.backward")
                    }
                }
                
                // More options button (trailing)
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        // Action for more button
                    }) {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }
    }
}

#Preview {
    TabBarViewWidget()
}
