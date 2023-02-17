//
//  ImagemTituloReceita.swift
//  projetohackacook
//
//  Created by Student03 on 13/02/23.
//

import SwiftUI

struct ImageTitleView: View {
    var imgUrl: URL
    var recipeName: String
    
    var body: some View {
        VStack {
            AsyncImage(url: imgUrl) { image in
                image
                    .resizable()
            } placeholder: {
                ShimmerEffectView(color: "Yellow")
            }
            .frame(height: 300)
            .ignoresSafeArea()
            
            Text(recipeName)
                .foregroundColor(Color("Yellow"))
                .font(.title).bold()
                .fontWeight(.medium)
                .padding()
        }
    }
}
