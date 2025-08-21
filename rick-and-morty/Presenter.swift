//
//  Presenter.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 21.08.2025.
//

class Presenter {
    
    private let networkService = NetworkService()
    
    init() {
        
    }
    
    func getCharacterName(_ characterName: String) {
        networkService.fetchCharacters(name: characterName) { [weak self] character in
            print("Character: \(character)")
        }
    }
}
