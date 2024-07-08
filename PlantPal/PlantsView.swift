//
//  PlantsView.swift
//  Plant Pal
//
//  Created by Mehmet eren Ortak on 8.07.2024.
//

import SwiftUI

struct PlantsView: View {
    var body: some View {
        VStack {
            List(1..<6) { i in
                Text("Bitkilerim \(i)")
                    .padding()
            }
        }
        .navigationTitle("Bitkilerim")
    
    }
}

struct PlantsView_Previews: PreviewProvider {
    static var previews: some View {
        PlantsView()
    }
}
