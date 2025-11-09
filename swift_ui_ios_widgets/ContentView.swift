//
//  ContentView.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 07/11/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var goToBasicView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Home Screen")
                    .font(.largeTitle)
                Button("Go Widget Page"){
                    goToBasicView = true
                }
                //                NavigationLink("Go to Detail View") {
                //                    BasicWidgets()
                //                }
                .buttonStyle(.borderedProminent)
            }.navigationDestination(isPresented: $goToBasicView) {
                BasicWidgets()
            }
            .navigationTitle("Main").navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
