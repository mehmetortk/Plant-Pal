//
//  RegisterView.swift
//  Plant Pal
//
//  Created by Mehmet eren Ortak on 11.07.2024.
//
import SwiftUI
import Firebase

struct RegisterView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var registerError = ""
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if !registerError.isEmpty {
                Text(registerError)
                    .foregroundColor(.red)
                    .padding()
            }
            
            Button(action: {
                guard password == confirmPassword else {
                    registerError = "Şifreler eşleşmiyor"
                    return
                }
                
                guard password.count >= 6 else {
                    registerError = "Şifre en az 6 karakter olmalıdır"
                    return
                }
                
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        registerError = error.localizedDescription
                    } else {
                        // Successful registration, go back to login
                        print("Registration successful")
                    }
                }
            }) {
                Text("Kayıt Ol")
                    .font(.title2)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding()
        .navigationTitle("Register")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
