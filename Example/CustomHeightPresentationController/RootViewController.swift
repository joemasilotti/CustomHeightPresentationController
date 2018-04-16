//
//  RootViewController.swift
//  CustomHeightPresentationController-Example
//
//  Created by Joe Masilotti on 04/16/2018.
//  Copyright (c) 2018 Masilotti.com. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        installSubviews()
    }

    private func installSubviews() {
        let button = UIButton(type: .system)
        button.setTitle("Present Modal", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        button.addTarget(self, action: #selector(presentModal), for: .touchUpInside)

        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    @objc private func presentModal() {
        present(ModalViewController(), animated: true, completion: nil)
    }
}
