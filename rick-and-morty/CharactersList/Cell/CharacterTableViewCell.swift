//
//  CharacterTableViewCell.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 21.08.2025.
//

import UIKit
import Foundation
import SnapKit

final class CharacterTableViewCell: UITableViewCell {
    
    static let identifier = "CharacterCell"
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(nameLabel)
        
        avatarImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(12)
            make.leading.equalToSuperview().offset(16)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with character: Character) {
        nameLabel.text = character.name
        
        if let imageURL = URL(string: character.image) {
            URLSession.shared.dataTask(with: imageURL) { [weak self] data, _, _ in
                if let data = data {
                    DispatchQueue.main.async {
                        self?.avatarImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
    }
}
