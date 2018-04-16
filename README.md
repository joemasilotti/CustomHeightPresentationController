# CustomHeightPresentationController

A tiny library (one `UIViewController`) that makes presenting modal screens much easier. It mimics the presentation animation and feel of `UIActionSheet` but leaves all design to the developer. A custom controller is animated up from the bottom of the screen and the view "underneath" is grayed out. Tapping anywhere on the presenting view will dismiss the presented controller.

## Example

![Screenshot](https://github.com/joemasilotti/CustomHeightPresentationController/blob/images/Screenshot.png)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

CustomHeightPresentationController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'CustomHeightPresentationController'
```

Create a UIViewController that conforms to `CustomHeightPresentable` and add the following to init():

```swift
modalPresentationStyle = .custom
transitioningDelegate = self
```

Then in that controller's extension of `UIViewControllerTransitioningDelegate` add the following:
```swift
func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    return CustomHeightPresentationController(presentedViewController: presented, presenting: presenting)
}
```

## Author

Joe Masilotti, joe@masilotti.com

## License

CustomHeightPresentationController is available under the MIT license. See the LICENSE file for more info.
