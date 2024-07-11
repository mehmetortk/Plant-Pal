//
//  LoginView.swift
//  Plant Pal
//
//  Created by Mehmet eren Ortak on 11.07.2024.
//

import SwiftUI
import Firebase

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showingRegisterView = false
    @State private var loginError = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                if !loginError.isEmpty {
                    Text(loginError)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    Auth.auth().signIn(withEmail: email, password: password) { result, error in
                        if let error = error {
                            loginError = error.localizedDescription
                        } else {
                            // Successful login, navigate to HomeView
                            print("Login successful")
                        }
                    }
                }) {
                    Text("Login")
                        .font(.title2)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                Button(action: {
                    showingRegisterView.toggle()
                }) {
                    Text("Hesabınız yoksa kayıt olun")
                        .padding()
                }
                .sheet(isPresented: $showingRegisterView) {
                    RegisterView()
                }
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

