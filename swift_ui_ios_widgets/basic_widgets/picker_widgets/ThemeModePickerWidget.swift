//
//  ThemeModePickerWidget.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 12/11/2025.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    case light = "Light"
    case dark = "Dark"
    case system = "System Default"
    
    var id: String { self.rawValue }
}

struct ThemeModePickerWidget: View {
    @State private var selectedTheme: AppTheme = .light
    @State private var shouldPresentSheet: Bool = false

    var body: some View {
        VStack {
            Picker("Select Theme", selection: $selectedTheme) {
                ForEach(AppTheme.allCases) { theme in
                    Text(theme.rawValue).tag(theme)
                }
            }.pickerStyle(.automatic)
            
            Button("Show Sheet") {
                shouldPresentSheet = true
            }
        }
        .sheet(isPresented: $shouldPresentSheet) {
            NavigationView {
                VStack {
                    Text("Bottom sheet inside route page")
                }
                .navigationTitle("Bottom Sheet")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: { shouldPresentSheet = false }) {
                            Image(systemName: "xmark")
                        }
                    }
                }.navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


#Preview {
    ThemeModePickerWidget()
}
