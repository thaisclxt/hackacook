//
//  AppBarView.swift
//  hackacook
//
//  Created by Student14 on 13/02/23.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("HackaCook")
            .resizable()
            .scaledToFill()
            .frame(width: 200, height: 130)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
