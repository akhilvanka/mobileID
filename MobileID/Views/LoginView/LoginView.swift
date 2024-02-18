//
//  LoginView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/18/24.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            FluidGradient(blobs: [.blue, .blue, .cyan, .cyan],
                          highlights: [.purple, .orange], speed: 0.15, blur: 0.80)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Button(action: {
                    
                }) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primary)
                        .cornerRadius(15)
                }
                .padding(.vertical)
            }
            .padding(.all)
        }
    }
}

struct SignInView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @FocusState private var isUsernameFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    var body: some View {
        VStack {
            Text("Let's sign you in.")
                .font(.largeTitle)
                .bold()
                .fontDesign(.serif)
                .frame(maxWidth: .infinity, alignment: .leading)
            VStack(spacing: 20) {
                TextField("", text: $username, prompt: Text("username").foregroundColor(Color.secondary))
                    .textFieldStyle(OutlineTextField(isFocused: isUsernameFocused))
                    .focused($isUsernameFocused)
                SecureField("", text: $password, prompt: Text("password").foregroundColor(Color.secondary))
                    .textFieldStyle(OutlineTextField(isFocused: isPasswordFocused))
                    .focused($isPasswordFocused)
            }
            .padding(.vertical)
            Spacer()
            Button(action: {
                
            }) {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.primary)
                    .cornerRadius(15)
            }
        }
        .padding(.all)
    }
}

struct OutlineTextField: TextFieldStyle {
    var isFocused: Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        configuration
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15).stroke(lineWidth: 2)
                    .fill(isFocused ? Color.primary : Color.secondary)
            )
    }
}


#Preview("Main") {
    LoginView()
}

#Preview("Sign In") {
    SignInView()
}
