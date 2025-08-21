//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 20.08.2025.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {
    
    private lazy var presenter = Presenter(view: self)
    
    private lazy var backgroundUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Wallpaper")
        imageView.frame = view.bounds
        return imageView
    }()
    
    private let textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Search..."
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 17)
        tf.textColor = .black
        tf.backgroundColor = .white
        return tf
    }()
    
    private let checkButton: UIButton = {
        let button = UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 350, height: 50)
        button.backgroundColor = .systemBackground
        button.setTitleColor(.lightGray, for: .normal)
        button.layer.cornerRadius = 10
        button.setTitle("Get info about a cartoon character", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        title = "Explore the cartoon Rick and Morty"
        view.addSubview(backgroundUIImageView)
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerY.equalToSuperview().offset(-100)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        
        view.addSubview(checkButton)
        checkButton.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        checkButton.addTarget(self, action: #selector(getTextFromField), for: .touchUpInside)
    }
    
    @objc func getTextFromField() {
        if let text = textField.text, !text.isEmpty {
            presenter.getCharacterName(text)
        } else {
            print("Text field is empty")
        }
    }
}

