//
//  PersonalView.swift
//  HackaCook
//
//  Created by Student19 on 13/02/23.
//

import SwiftUI

struct PersonalView: View {
    var urlImage = "https://img.freepik.com/fotos-gratis/mulher-de-tiro-medio-preparando-comida_23-2148939278.jpg?w=900&t=st=1676292413~exp=1676293013~hmac=6f017f7391ad541445f6eb32258215c8d7eac364c7191e1d9ffe309f3734315b"
    
    var email = "annaterra21348@gmail.com"
    
    var body: some View {
        HStack (spacing: 20) {
            Spacer()
            VStack (spacing: 10){
                TitleView(text: "Anna Terra")
            
                Text(email)
                    .foregroundColor(Color("Yellow"))
                    .font(.custom("Georgia", size: 15))
                    .multilineTextAlignment(.center)
                
            }
            AsyncImage(url: URL(string: urlImage)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .cornerRadius(50)
            } placeholder: {
                ShimmerEffectView(color: "Yellow")
                    .frame(height: 200)
                    .cornerRadius(50)
            }
            Spacer()
        }
    }
}

struct PersonalView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalView()
    }
}
