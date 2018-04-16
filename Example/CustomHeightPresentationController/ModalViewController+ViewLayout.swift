//
//  ModalViewController+ViewLayout.swift
//  CustomHeightPresentationController-Example
//
//  Created by Joe Masilotti on 4/16/18.
//  Copyright © 2018 Masilotti.com. All rights reserved.
//

import UIKit

extension ModalViewController {
    func installSubviews() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            // Note that the UIStackView is _not_ pinned to the bottom.
        ])
        
        let dismissButton = UIButton(type: .system)
        dismissButton.setTitle("Close", for: .normal)
        dismissButton.contentHorizontalAlignment = .right
        dismissButton.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        stackView.addArrangedSubview(dismissButton)

        let titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.text = "Custom Height\nPresentation Controller"
        titleLabel.font = UIFont(name: "Menlo-Regular", size: 22)
        titleLabel.textAlignment = .center
        stackView.addArrangedSubview(titleLabel)

        let subtitleLabel = UILabel()
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = "The controller can be customized like any other UIViewController. Any subviews can be added and arranged as you like.\n\nDismiss by tapping the 'Close' button or tapping anywhere in the grayed out area above."
        stackView.addArrangedSubview(subtitleLabel)

        let bottomSpacer = UIView()
        bottomSpacer.heightAnchor.constraint(equalToConstant: 8).isActive = true
        stackView.addArrangedSubview(bottomSpacer)
    }
}
