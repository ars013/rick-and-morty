//
//  CharacterResponse.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 21.08.2025.
//

struct CharacterResponse: Codable {
    let results: [Character]
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let image: String
}
