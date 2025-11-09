//
//  BasicWidgets.swift
//  swift_ui_ios_widgets
//
//  Created by Kyaw Thiha on 07/11/2025.
//

import SwiftUI


struct BasicWidgets : View {
    @State private var simpleTextField: String = ""
    @State private var value: String = ""
    @State private var password: String = ""
    @FocusState private var isFocused: Bool
    @FocusState private var numberFocused: Bool
    //    @FocusState private var emailFieldIsFocused: Bool = false
    
    var body : some View {
        NavigationStack {
            VStack {
                Text("Vertial Stack")
                TextField(
                    "User name (email address)",
                    text: $simpleTextField
                )
                .font(.system(size: 16, weight: .medium))
                // wraning under line with red
                .disableAutocorrection(true)
                .focused($isFocused)
                .onSubmit {
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                    .disableAutocorrection(true)
                SecureField("Enter your password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .textContentType(.password)
                TextField("Amount", text: $value)   // or .numberPad
                    .textContentType(.none)
                    .keyboardType(.numberPad)
                    .focused($numberFocused)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            Button("Done") { numberFocused = false }
                        }
                    }
                    .textFieldStyle(.roundedBorder)
            }.padding().navigationTitle("Basic Widgets").toolbar {
                ToolbarItem{
                    Image(systemName: "compass.drawing").onTapGesture {
                        print("drawing icon clicked")
                    }
                }
            }.navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct BasicWidgetsPreview: PreviewProvider {
    static var previews: some View {
        BasicWidgets()
    }
}
