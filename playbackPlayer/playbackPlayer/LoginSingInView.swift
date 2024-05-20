//
//  LoginSingInView.swift
//  playbackPlayer
//
//  Created by Abdalla Elnajjar on 2024-02-14.
//

import SwiftUI

struct LoginSingInView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginView()) {
                    Text("Login")
                        .bold()
                        .frame(width: 70,height: 40)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        
                }
                .padding()
                
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 70,height: 40)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                .padding()
            }
        }
    }
}

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textCase(.lowercase)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Perform login action
                AuthManager.shared.loginUser(email: email, password: password) { result in
                    switch result {
                    case .success(let user):
                        print("User logged in: \(user)")
                        // Navigate to the main screen or perform any necessary action
                    case .failure(let error):
                        print("Failed to log in: \(error.localizedDescription)")
                        // Show error message to the user
                    }
                }
            }) {
                Text("Login")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding()
        }
        .padding()
    }
}

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textCase(.lowercase)
                .keyboardType(.emailAddress)
                
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                // Perform sign-up action
                AuthManager.shared.registerUser(email: email, password: password) { result in
                    switch result {
                    case .success(let user):
                        print("User registered and logged in: \(user)")
                        // Navigate to the main screen or perform any necessary action
                    case .failure(let error):
                        print("Failed to register user: \(error.localizedDescription)")
                        // Show error message to the user
                    }
                }
            }) {
                Text("Sign Up")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            .padding()
        }
        .padding()
    }
}





#Preview {
    LoginSingInView()
}
