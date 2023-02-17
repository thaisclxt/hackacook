//
//  IngredientesReceita.swift
//  projetohackacook
//
//  Created by Student03 on 13/02/23.
//

import SwiftUI

struct RecipeCardInput: View {
    
    @Binding var content: [String]
    @State var id: Int = 0
    var cardName: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("Yellow"))
                .shadow(radius: 2)
            VStack(alignment: .leading) {
                Text("\(cardName): ")
                    .foregroundColor(.white)
                
                VStack{
                    ForEach(0..<content.count, id: \.self){ index in
                        VStack() {
                            TextField("Adicionar...", text: self.$content[index])
                                .foregroundColor(.white)
                        }
                    }
                    Button(action:{
                        if(!self.content[self.content.count - 1].isEmpty) {
                            self.content.append("")
                            self.id += 1
                        }
                    }) {
                        Text("+")
                            .foregroundColor(.white)
                    }
                }
            }.padding()
        }.padding()
    }
    
    func startInput() {
        
    }
    
}
