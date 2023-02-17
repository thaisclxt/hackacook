//
//  NewRecipePageView.swift
//  HackaCook
//
//  Created by Student19 on 13/02/23.
//

import SwiftUI

struct SaveDetails: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}

struct NewRecipePageView: View {

    @State var selectedImageData: Data? = nil
    
    @State var recipeName: String = ""
    
    @State var ingredientes: [String] = [""]
    
    @State var modoDePreparo: [String] = [""]
    
    @State var outrasInformacoes: [String] = [""]
    
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color("CardColor"))
                .ignoresSafeArea()
            
            ScrollView() {
                
                LogoView()
                
                ImageInput(selectedImageData: $selectedImageData)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.white)
                        .frame(width: 365,height: 40)
                    TextField("Nome da receita", text: $recipeName).multilineTextAlignment(.center)
                }
                
                RecipeCardInput(content: $ingredientes, cardName: "Ingredientes")
                
                RecipeCardInput(content: $modoDePreparo, cardName: "Modo de preparo")
                
                RecipeCardInput(content: $outrasInformacoes, cardName: "Outras infromações")
                
                Button(action: mostraCampos) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("Yellow"))
                            .frame(width: 160, height: 40)
                        Text("Enviar receita")
                            .foregroundColor(.white)
                    }
                }.alert(isPresented: $showAlert) {
                    Alert(title: Text("Receita enviada com sucesso!"))
                }
            }
        }
    }
    func mostraCampos() {
        print(selectedImageData ?? "oie")
        showAlert = true
    }
}

struct NewRecipePageView_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipePageView()
    }
}
