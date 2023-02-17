//
//  APIView.swift
//  HackaCook
//
//  Created by Nathan Machado on 13/02/23.
//

import SwiftUI


struct Recipe: Codable, Identifiable {
    let id = UUID()
    let _id : String
    var name : String
    let author: String
    let image: String
    let ingredients : [String]
    let directions : [String]
    let otherInfo : [String]
}

struct MyVariables {
    
    static var favorites : [String] = []
    
}

public class RecipeFetcher: ObservableObject {
    @Published var recipe = [Recipe]()
    
    init(){
        load()
    }


    func load() {
        let url = URL(string: "http://192.168.128.244:1880/gethackacook")!
    
        URLSession.shared.dataTask(with: url) {(data,response,error) in
            do {
                if let d = data {
                    let decodedrecipe = try JSONDecoder().decode([Recipe].self, from: d)
                    DispatchQueue.main.async {
                        self.recipe = decodedrecipe
                    }
                }else {
                    print("No Data")
                }
            } catch {
                print ("Error")
            }
            
        }.resume()
         
    }
}



