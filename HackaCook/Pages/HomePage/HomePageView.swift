import SwiftUI

struct HomePageView: View {
    
    @ObservedObject var fetcher = RecipeFetcher()
    @State var receitas = [Recipe]()
    @State var searchText = ""
    @State var count = 0
    @State private var searchShowField = false
    
    var body: some View {
        ZStack {
            Color("CardColor")
                .ignoresSafeArea()
            
            ScrollView{
                VStack {
                    LogoView()
                        .padding(.vertical, -20.0)
                    
                    HStack {
                        TitleView(text: "Receitas")
                        RectangleView(width: 190)
                    }.padding(.bottom)
                    
                    HStack {
                        TextField("Ex: Macorronada ou Morangos...", text: $searchText)
                            .padding(7)
                            .background(Color(.white))
                            .cornerRadius(8)
                            .padding(.horizontal, 10)
                            .onTapGesture {
                                self.searchShowField = true
                            }.onChange(of: searchText) { _ in
                                receitas = fetcher.recipe.filter { recipe in
                                    if (recipe.name.contains(searchText) || recipe.ingredients.contains(where: {$0.range(of: searchText, options: .caseInsensitive) != nil})) {
                                        return true
                                    }
                                    return false
                                }
                            }
                        
                        if searchShowField {
                            Button(action: {
                                self.searchShowField = false
                                self.searchText = ""})
                            {
                                Text("Cancel").foregroundColor(Color("Yellow"))
                            }
                            .padding(.trailing, 10)
                            .transition(.move(edge: .trailing))
                        }
                    }.padding()
                }
                
                if (fetcher.recipe.isEmpty) {
                    Text("Que tristeza!")
                    Text("Sem receitas no banco de dados...")
                    Image("Triste")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                
                if (searchText != "") {
                    ForEach(receitas){recipe in
                        CardRecipeView(id: recipe._id, name: recipe.name, author: recipe.author, image: recipe.image, recipe: recipe)
                    }
                } else {
                    ForEach(fetcher.recipe){recipe in
                        CardRecipeView(id: recipe._id, name: recipe.name, author: recipe.author, image: recipe.image, recipe: recipe)
                        
                    }
                }

            }
        }
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
