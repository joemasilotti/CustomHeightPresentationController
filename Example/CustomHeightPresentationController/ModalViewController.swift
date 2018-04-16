//
//  ModalViewController.swift
//  CustomHeightPresentationController-Example
//
//  Created by Joe Masilotti on 4/16/18.
//  Copyright © 2018 Masilotti.com. All rights reserved.
//

import UIKit
import CustomHeightPresentationController

class ModalViewController: UIViewController, CustomHeightPresentable {
    var expectedHeight: CGFloat {
        stackView.layoutIfNeeded()
        return stackView.frame.height
    }

    let stackView = UIStackView()

    init() {
        super.init(nibName: nil, bundle: nil)
        modalPresentationStyle = .custom
        transitioningDelegate = self
    }

    required init?(coder aDecoder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        stackView.axis = .vertical
        stackView.spacing = 16
        installSubviews()
    }

    func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

extension ModalViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomHeightPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
