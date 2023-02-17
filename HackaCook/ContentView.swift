//
//  ContentView.swift
//  HackaCook
//
//  Created by Student19 on 13/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomePageView()
            .tabItem{
                Label("Receitas", systemImage: "frying.pan.fill")
            }
            
            FavPageView()
            .tabItem{
                Label("Favoritos", systemImage: "star.square.on.square.fill")
            }.toolbar(.visible, for: .tabBar)

            NewRecipePageView()
            .tabItem{
                Label("Nova receita", systemImage: "plus.circle.fill")
            }
            
            PerfilPageView()
            .tabItem{
                Label("Perfil", systemImage: "person.crop.circle.fill")
            }
        }
        .tint(Color("Yellow"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
