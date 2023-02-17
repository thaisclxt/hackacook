//
//  InitialPageView.swift
//  HackaCook
//
//  Created by Student19 on 13/02/23.
//

import SwiftUI

struct InitialPageView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Wallpaper")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading) {
                    LogoView()
                    
                    Text("Encontre sua receita!")
                        .font(.headline)
                        .padding(.leading, 45.0)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color("Yellow"))
                    
                    NavigationLink {
                        ContentView()
                    } label: {
                        Text("Iniciar")
                    }
                    .tint(Color("Yellow"))
                    .buttonStyle(.borderedProminent)
                    .padding(.leading, 45.0)
                }
            }
        }
    }
}

struct InitialPageView_Previews: PreviewProvider {
    static var previews: some View {
        InitialPageView()
    }
}
