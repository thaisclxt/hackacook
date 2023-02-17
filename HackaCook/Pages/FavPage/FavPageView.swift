//
//  FavPageView.swift
//  HackaCook
//
//  Created by Student19 on 13/02/23.
//

import SwiftUI

struct FavPageView: View {
    @ObservedObject var fetcher = RecipeFetcher()
    @State var receitas = [Recipe]()
    var body: some View {
        ZStack {
            Color("CardColor")
                .ignoresSafeArea()
            
            ScrollView {
                LogoView()
                    .padding(.vertical, -20.0)
                
                HStack {
                    TitleView(text: "Meus Favoritos")
                    RectangleView(width: 120)
                }.padding()
                
                ForEach(receitas){recipe in
                    CardRecipeView(id: recipe._id, name: recipe.name, author: recipe.author, image: recipe.image, recipe: recipe)
                }
                
                if (receitas.isEmpty) {
                    Text("Sem receitas favoritas!")
                    Image("Triste")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
        }.onAppear(){
            receitas = fetcher.recipe.filter {
                recipe in MyVariables.favorites.contains { favorite in
                    if recipe._id == favorite {
                        return true;
                    } else {
                        return false;
                    }
                }
            }
        }
    }
}

struct FavPageView_Previews: PreviewProvider {
    static var previews: some View {
        FavPageView()
    }
}
