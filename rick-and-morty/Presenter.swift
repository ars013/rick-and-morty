//
//  Presenter.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 21.08.2025.
//

import UIKit

final class Presenter {
    
    private weak var view: UIViewController?
    private lazy var wireframe = Wireframe(rootView: view)
    private let networkService = NetworkService()
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func getCharacterName(_ characterName: String) {
        networkService.fetchCharacters(name: characterName) { [weak self] characters in
            print("Characters: \(characters)")
            self?.wireframe.presentCharacterList(characters)
        }
    }
}
