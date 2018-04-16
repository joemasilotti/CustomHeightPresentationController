//
//  CustomHeightPresentationController.swift
//  CustomHeightPresentationController
//
//  Created by Joe Masilotti on 4/16/18.
//  Copyright © 2018 Masilotti.com. All rights reserved.
//

import UIKit

@objc public protocol CustomHeightPresentable: class {
    var expectedHeight: CGFloat { get }
    @objc func dismissSelf()
}

/// A presentation wrapper to show a UIViewController that doesn't fill the full screen with a grayed out background.
///
/// To use create a UIViewController that conforms to CustomHeightPresentable. Add the following to init():
///     modalPresentationStyle = .custom
///     transitioningDelegate = self
///
/// Then in that controller's extension of UIViewControllerTransitioningDelegate add the following:
///     func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
///         return CustomHeightPresentationController(presentedViewController: presented, presenting: presenting)
///     }
///
open class CustomHeightPresentationController : UIPresentationController {
    private let dimmingView = UIView()
    private weak var customHeightPresentable: CustomHeightPresentable?

    public override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)

        customHeightPresentable = presentedViewController as? CustomHeightPresentable

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dimmingViewTapped))
        dimmingView.addGestureRecognizer(tapGestureRecognizer)
    }

    open override var frameOfPresentedViewInContainerView: CGRect {
        if let presentedController = presentedViewController as? CustomHeightPresentable, let containerView = containerView {
            let height = presentedController.expectedHeight
            return CGRect(x: 0, y: containerView.bounds.height - height, width: containerView.bounds.width, height: height)
        }
        return CGRect.zero
    }

    open override func presentationTransitionWillBegin() {
        guard let containerView = containerView else { return }

        dimmingView.frame = containerView.frame
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        containerView.addSubview(dimmingView)
        dimmingView.addSubview(presentedViewController.view)

        dimmingView.alpha = 0
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            self.dimmingView.alpha = self.dimmingViewAlpha
        }) { (_) in
            if self.isPresentingOnAnotherDimmedView {
                self.dimmingView.backgroundColor = UIColor.clear
                self.dimmingView.alpha = 1
            }
        }
    }

    open override func dismissalTransitionWillBegin() {
        dimmingView.alpha = 1
        presentingViewController.transitionCoordinator?.animate(alongsideTransition: { (_) in
            self.dimmingView.alpha = 0
        })
    }

    open override func dismissalTransitionDidEnd(_ completed: Bool) {
        dimmingView.removeFromSuperview()
    }

    @objc private func dimmingViewTapped() {
        customHeightPresentable?.dismissSelf()
    }

    private var dimmingViewAlpha: CGFloat {
        return isPresentingOnAnotherDimmedView ? 0 : 1
    }

    private var isPresentingOnAnotherDimmedView: Bool {
        return presentingViewController as? CustomHeightPresentable != nil
    }
}
