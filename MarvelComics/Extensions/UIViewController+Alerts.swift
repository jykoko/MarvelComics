//
//  UIViewController+Alerts.swift
//  MarvelComics
//
//  Created by Jacob Koko on 3/7/22.
//

import UIKit.UIViewController

/// Extension that provides a simplified API for displaying alerts within a ViewController
extension UIViewController {
    
    /// Helper function to present an alert controller from any view controller
    /// This is a very simple example, we could pass in UIAlertActions as well via parameter injection
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alertController, animated: true, completion: nil)
    }
}
