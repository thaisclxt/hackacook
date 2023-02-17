//
//  PerfilPageView.swift
//  HackaCook
//
//  Created by Student19 on 13/02/23.
//

import SwiftUI

struct PerfilPageView: View {
    
    @ObservedObject var fetcher = RecipeFetcher()
    @State var receitas = [Recipe]()
    
    var body: some View {
        ZStack {
            Color("CardColor")
                .ignoresSafeArea()
            
            ScrollView {
                LogoView()
                    .padding(.vertical, -20.0)
                
                PersonalView()
                
                HStack {
                    Text("Minhas receitas")
                        .font(.title2).bold()
                        .foregroundColor(Color("Yellow"))

                    RectangleView(width: 175)
                }.padding()
                
                ForEach(receitas){recipe in
                    CardRecipeView(id: recipe._id, name: recipe.name, author: recipe.author, image: recipe.image, recipe: recipe)
                }
                
                if (receitas.isEmpty) {
                    Text("Você não tem nenhuma receita!")
                    Text("Clique em nova receita para adicionar uma")
                    Image("Triste")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }.onAppear() {
            receitas = fetcher.recipe.filter { recipe in
                if (recipe.author == "Anna Terra") {
                    return true
                }
                return false
            }
        }
    }
}

struct PerfilPageView_Previews: PreviewProvider {
    static var previews: some View {
        PerfilPageView()
    }
}
