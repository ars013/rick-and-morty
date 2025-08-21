//
//  ViewController.swift
//  rick-and-morty
//
//  Created by Asankulov Arslan on 20.08.2025.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
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
        button.setTitle("Get info about a cartoon character", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    func setupViews() {
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
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
            print("User entered: \(text)")
        } else {
            print("Text field is empty")
        }
    }
}

