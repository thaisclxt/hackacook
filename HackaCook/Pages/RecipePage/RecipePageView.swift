//
//  ContentView.swift
//  projetohackacook
//
//  Created by Student03 on 10/02/23.
//

import SwiftUI

struct RecipePageView: View {
    
    var recipeId: String = ""
    @ObservedObject var fetcher = RecipeFetcher()
    @State var recipe: Recipe?
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("CardColor"))
                .ignoresSafeArea()
            
            ScrollView() {
                if (recipe == nil) {
                    VStack (alignment: .leading){
                        Spacer()
                        ProgressView()
                    }
                } else {
                    ImageTitleView(imgUrl: URL(string: recipe?.image ?? "")!, recipeName: recipe?.name ?? "Carregando...")
                        
                    RecipeCard(content: recipe?.ingredients ?? ["..."], cardName: "Ingredientes")
                    
                    RecipeCard(content: recipe?.directions ?? ["..."], cardName: "Modo de preparo")
                    
                    RecipeCard(content: recipe?.otherInfo ?? ["..."], cardName: "Outras infromações")
                }
            }.ignoresSafeArea()
        }.onAppear {
            fetcher.recipe.filter {
                recipeGet in
                    if recipeGet._id == recipeId {
                        recipe = recipe
                        return true;
                    } else {
                        recipe = recipe
                        return false;
                    }
            }
        }
    }
}
