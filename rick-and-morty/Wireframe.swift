//
//  Wireframe.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 21.08.2025.
//

import Foundation
import UIKit

protocol IWireframe {
    
    func presentCharacterList(_ characters: [Character])
}


final class Wireframe: IWireframe {
    
    private weak var rootView: UIViewController?
    
    init(rootView: UIViewController?) {
        self.rootView = rootView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func presentCharacterList(_ characters: [Character]) {
        let viewController = CharactersListViewController(characters: characters)
        rootView?.navigationController?.pushViewController(viewController, animated: true)
    }
}
