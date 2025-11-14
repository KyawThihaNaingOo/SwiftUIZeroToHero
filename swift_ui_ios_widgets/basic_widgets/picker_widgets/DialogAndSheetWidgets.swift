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

struct DialogAndSheetWidgets: View {
    @State private var selectedTheme: AppTheme = .light
    @State private var shouldPresentSheet: Bool = false
    @State private var showSimpleDialog: Bool = false
    @State private var showConfirmDialog: Bool = false
    
    var body: some View {
        ZStack {
            VStack(spacing:8) {
                Picker("Select Theme", selection: $selectedTheme) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.rawValue).tag(theme)
                    }
                }.pickerStyle(.automatic)
                
                Button("Show Simple Dialog") {
                    showSimpleDialog = true
                }
                Button("Show Confirm Dialog") {
                    showConfirmDialog = true
                }
                .confirmationDialog("Are you sure you want to delete?", isPresented: $showConfirmDialog, titleVisibility: .visible) {
                    Button("Delete Permanently", role: .destructive) { }
                    Button("Move to Trash") { }
                    Button("Cancel", role: .close) { }
                } message: {
                    Text("This action cannot be undone.")
                }
                
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
                .presentationDetents([.medium, .large])
                .presentationDragIndicator(.visible)
            }
            /// Simple dialog
            .alert("Theme Saved", isPresented: $showSimpleDialog) {
                // You can add buttons here
                Button("OK", role: .cancel) { }
            } message: {
                Text("Your selected theme (\(selectedTheme.rawValue)) has been applied.")
            }
            
            Picker("Select Theme", selection: $selectedTheme) {
                ForEach(AppTheme.allCases) { theme in
                    Text(theme.rawValue).tag(theme)
                }
            }.pickerStyle(.automatic)
        }
    }
}


#Preview {
    DialogAndSheetWidgets()
}
