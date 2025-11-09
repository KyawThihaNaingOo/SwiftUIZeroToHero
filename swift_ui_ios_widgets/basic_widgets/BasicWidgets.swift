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
    @FocusState private var isPasswordFocused: Bool
    @FocusState private var numberFocused: Bool
    @State private var userName: String = ""
    @FocusState private var userNameFocused: Bool
    
    var body : some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextField(
                        "User name (email address)",
                        text: $simpleTextField
                    )
                    .keyboardType(.emailAddress)
                    .font(.system(size: 16, weight: .medium))
                    // wraning under line with red
                    .disableAutocorrection(true)
                    .focused($isFocused)
                    .onSubmit {
                    }.textFieldStyle(RoundedBorderTextFieldStyle())
                        .disableAutocorrection(true)
                    /// password
                    SecureField("Enter your password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textContentType(.password)
                        .textFieldStyle(.roundedBorder)
                        .focused($isPasswordFocused)
                    /// Amount Field
                    TextField("Amount", text: $value)   // or .numberPad
                        .textContentType(.none)
                        .keyboardType(.decimalPad)
                        .focused($numberFocused)
                        .textFieldStyle(.roundedBorder)
                    /// User name field
                    HStack {
                        // Prefix icon
                        Image(systemName: "person.fill")
                            .foregroundColor(.gray)
                        
                        // TextField
                        TextField("Username", text: $userName)
                            .focused($userNameFocused)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                        
                        // Suffix icon (e.g., clear button)
                        if !userName.isEmpty {
                            Button(action: {
                                userName = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    //                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(isFocused ? Color.blue : Color.gray.opacity(0.5), lineWidth: 1)
                    )
                    ///
                    Text("Button Styles")
                    Divider()
                    Button("Styled") {
                        print("Text Button Clicked")
                    }
                    //                    .buttonStyle(.bordered)
                    .buttonStyle(.borderedProminent)
                    //                    .buttonStyle(.plain)
                    Button("Delete", role: .destructive) {
                        print("Delete tapped")
                    }
                    Button("Cancel", role: .cancel) {
                        print("Cancel tapped")
                    }
                    Button("Confirm", role: .confirm) {
                        
                    }
                    Button("Close", role: .close) {
                        
                    }
                    Button {
                        print("Label Button tapped")
                    } label: {
                        Label("Favorite", systemImage: "star")
                    }
                }.toolbar {
                    // Keyboard expend show done button
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done", role: .confirm) {
                            dismiss()
                        }
                        //                        Button("Done") { numberFocused = false }
                    }
                }.scrollDisabled(false).padding().navigationTitle("Basic Widgets").toolbar {
                    ToolbarItem{
                        Image(systemName: "compass.drawing").onTapGesture {
                            print("drawing icon clicked")
                        }
                    }
                }.navigationBarTitleDisplayMode(.inline)
            }.onTapGesture {
                dismiss()
            }
            
        }
    }
    func dismiss(){
        if numberFocused {
            numberFocused = false
        }
        if isFocused {
            isFocused = false
        }
        if isPasswordFocused {
            isPasswordFocused = false
        }
    }
}

struct BasicWidgetsPreview: PreviewProvider {
    static var previews: some View {
        BasicWidgets()
    }
}
