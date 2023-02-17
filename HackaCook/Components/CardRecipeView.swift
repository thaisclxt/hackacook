//
//  CardRecipeView.swift
//  HackaCook
//
//  Created by Student19 on 13/02/23.
//

import SwiftUI

struct CardRecipeView: View {
    var id: String
    var name: String
    var author: String
    var image: String
    @State private var pressed: Bool?
    var recipe: Recipe?

    
    init(id: String, name: String, author: String, image: String, recipe: Recipe?) {
       self.id = id
        self.name = name
        self.author = author
        self.image = image
        self.recipe = recipe
        self.pressed = MyVariables.favorites.contains(id)
    }
    
    
    var body: some View {
        ZStack {
            NavigationLink {
                RecipePageView(recipe: recipe)
            } label: {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color("Yellow"))
            }
            HStack {
                VStack{
                    NavigationLink {
                        RecipePageView(recipe: recipe)
                    } label: {
                        AsyncImage(url: URL(string: image)) { image in
                            image
                                .resizable()
                                .aspectRatio(1/1, contentMode: .fit)
                        } placeholder: {
                            ZStack {
                                Image("Talheres")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .padding()
                                ShimmerEffectView(color: "Gray").frame(width: 150)
                            }
                        }
                    }
                }
                Spacer()
                VStack(alignment: .center) {
                    Spacer()
                    NavigationLink{
                        RecipePageView(recipe: recipe)
                    } label: {
                        Text(name)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.white)
                    }
                    Text(author).foregroundColor(.white)
                    Spacer()
                    Button {
                    } label: {
                        ZStack {
                            Rectangle().fill(Color("yellow"))
                                .frame(width: 40, height: 40)
                            Image(systemName: pressed ?? MyVariables.favorites.contains(id) ? "heart.fill" : "heart")
                                .foregroundColor(.white)
                                .onTapGesture {
                                    if MyVariables.favorites.contains(id){
                                        pressed = false
                                        let index = MyVariables.favorites.firstIndex(of: id)
                                        MyVariables.favorites.remove(at: index!)
                                    } else {
                                        pressed = true
                                        MyVariables.favorites.append(id)
                                    }
                                }
                        }
                    }
                    Spacer()
                }
                Spacer()
            }
        }.padding().frame(height: 180)
    }
}

struct CardRecipeView_Previews: PreviewProvider {
    static var previews: some View {
        CardRecipeView(id: "123", name: "Bolo de chocolate", author: "Ana Terra", image: "https://receitinhas.com.br/wp-content/uploads/2022/08/macarronada-sem-gluten-2.jpg", recipe: nil)
    }
}
