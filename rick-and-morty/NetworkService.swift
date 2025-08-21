//
//  NetworkLayer.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 21.08.2025.
//

import Foundation

class NetworkService {
    
    init() {
        
    }
    
    func fetchCharacters(name: String, completion: @escaping ([Character]) -> Void) {
        guard let url = URL(string: "http://localhost:8080/api/character?name=\(name)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decoded = try JSONDecoder().decode(CharacterResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decoded.results)
                }
            } catch {
                print("Decoding error:", error)
            }
        }.resume()
    }
}
