//
//  RectangleView.swift
//  HackaCook
//
//  Created by Student19 on 14/02/23.
//

import SwiftUI

struct RectangleView: View {
    @State var width: CGFloat
    
    var body: some View {
        Rectangle()
            .fill(Color("Yellow"))
            .frame(width: width, height: 1, alignment: .center)
            .padding(.leading, 15.5)
    }
}
