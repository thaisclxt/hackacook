//
//  ShimmerEffectView.swift
//  HackaCook
//
//  Created by Student19 on 14/02/23.
//

import SwiftUI

struct ShimmerEffectView: View {
    private struct Constants {
        static let duration: Double = 0.9
        static let minOpacity: Double = 0.25
        static let maxOpacity: Double = 1.0
        static let cornerRadius: CGFloat = 2.0
    }
    
    @State private var opacity: Double = Constants.minOpacity
    
    var color: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: Constants.cornerRadius)
            .fill(Color(color))
            .opacity(opacity)
            .transition(.opacity)
            .onAppear {
                let baseAnimation = Animation.easeInOut(duration: Constants.duration)
                let repeated = baseAnimation.repeatForever(autoreverses: true)
                withAnimation(repeated) {
                    self.opacity = Constants.maxOpacity
                }
        }
    }
}

struct ShimmerEffectView_Previews: PreviewProvider {
    static var previews: some View {
        ShimmerEffectView(color: "Yellow")
    }
}
