//
//  OTUIView.swift
//  Otrium
//
//  Created by Amila Dimantha on 2021-03-22.
//

import UIKit

class OTUIView: UIView {
    /// Adds sub view with contraints enabled
    /// - Parameter view: the view to add
    internal func addSubviewForConstrainted(view: UIView) {
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UIView {
    
    /// Displays a blurred view with a spinner, Covers full view
    func showBlurLoader() {
        DispatchQueue.main.async {
            let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.alpha = 0.8
            blurEffectView.tag = 99999
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
            activityIndicator.startAnimating()
            
            blurEffectView.contentView.addSubview(activityIndicator)
            activityIndicator.center = blurEffectView.contentView.center
            activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            self.addSubview(blurEffectView)
        }
    }
    
    /// Hides the blur view if shown
    func hideBlurLoader() {
        DispatchQueue.main.async {
            self.subviews.compactMap {  $0 as? UIVisualEffectView }.forEach {
                if $0.tag == 99999 {
                    $0.removeFromSuperview()
                }
            }
        }
    }
}


