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
    }
}

