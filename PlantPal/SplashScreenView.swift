//
//  SplashScreenView.swift
//  Plant Pal
//
//  Created by Mehmet eren Ortak on 11.07.2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    
    var body: some View {
        VStack {
            if isActive {
                LoginView()
            } else {
                Text("Plant Pal")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.isActive = true
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
