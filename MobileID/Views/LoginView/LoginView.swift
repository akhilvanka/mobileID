//
//  LoginView.swift
//  MobileID
//
//  Created by Akhil Vanka on 2/18/24.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    
    @State private var logInViewScene: Bool = false
    
    var body: some View {
        if logInViewScene {
            SignInView(sceneStatus: $logInViewScene)
        } else {
            ZStack {
                FluidGradient(blobs: [.blue, .blue, .cyan, .cyan],
                              highlights: [.purple, .orange], speed: 0.15, blur: 0.80)
                .ignoresSafeArea()
                VStack {
                    Spacer()
                    Button(action: {
                        withAnimation(.easeInOut(duration: 0.4)) {
                            logInViewScene = true
                        }
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
}

struct SignInView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @FocusState private var isUsernameFocused: Bool
    @FocusState private var isPasswordFocused: Bool
    
    @State private var isLoading: Bool = false
    @Binding var sceneStatus: Bool
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        sceneStatus = false
                    }
                }, label: {
                    Image(systemName: "arrow.turn.up.left")
                        .font(.largeTitle)
                        .foregroundStyle(Color.primary)
                        .padding(.vertical)
                })
                Spacer()
            }
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
                self.isLoading = true
                AuthenticationService().authenticateUser(username: username, password: password) { tokenStruct in
                    do {
                        let decodeToken: oAuthCredentials = try tokenStruct.decodedObject()
                        let authenticatedUser = User(name: username, resourceKey: decodeToken.resourceOwnerKey, resourceSecret: decodeToken.resourceOwnerSecret)
                        modelContext.insert(authenticatedUser)
                        self.isLoading = false
                    } catch {
                        print("Error somewhere idiot")
                    }
                }
                
                
                
            }) {
                if isLoading {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(Color.primary)
                        .frame(height: 50)
                        .overlay {
                            ProgressView()
                                .tint(Color(UIColor.systemBackground))
                        }
                } else {
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.primary)
                        .cornerRadius(15)
                }
            }
            .padding(.vertical)
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
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: User.self, configurations: config)
    
    return LoginView()
        .modelContainer(container)
}
