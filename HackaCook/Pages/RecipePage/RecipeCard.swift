//
//  IngredientesReceita.swift
//  projetohackacook
//
//  Created by Student03 on 13/02/23.
//

import SwiftUI

struct RecipeCard: View {
    
    var content: [String]
    var cardName: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .shadow(radius: 2)
            VStack(alignment: .leading) {
                Text("\(cardName): ")
                
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(content, id: \.self) { ingrediente in
                            HStack {
                                Text(String(content.firstIndex(of: ingrediente)! + 1))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                Text(ingrediente)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            }.padding()
        }.padding()
    }
}
