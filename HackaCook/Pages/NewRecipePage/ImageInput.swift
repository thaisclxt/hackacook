//
//  ImageInput.swift
//  projetohackacook
//
//  Created by Student03 on 13/02/23.
//

import SwiftUI
import PhotosUI

struct ImageInput: View {
    
    @State private var selectedPhoto: PhotosPickerItem? = nil
    @Binding var selectedImageData: Data?
    
    var body: some View {
        
        PhotosPicker(
            selection: $selectedPhoto,
            matching: .images,
            photoLibrary: .shared()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color("Yellow"))
                        .frame(width: 160, height: 40)
                    Text("Escolha uma foto")
                        .foregroundColor(.white)
                }
            }
            .onChange(of: selectedPhoto) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        selectedImageData = data
                    }
                }
            }
                
        if let selectedImageData,
           let uiImage = UIImage(data: selectedImageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .frame(width: 300, height: 300)
        }
    }
    
    func getImage() {
        return 
    }
}
