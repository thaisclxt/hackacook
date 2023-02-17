//
//  TitleView.swift
//  HackaCook
//
//  Created by Student19 on 14/02/23.
//

import SwiftUI

struct TitleView: View {
    @State var text: String
    
    var body: some View {
        Text(text)
            .font(.title).bold()
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(Color("Yellow"))
    }
}
