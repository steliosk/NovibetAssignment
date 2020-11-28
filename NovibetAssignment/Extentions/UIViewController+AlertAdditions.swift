//
//  UIView+AlertAdditions.swift
//  NovibetAssignment
//
//  Created by Stelios Kavouras on 28/11/20.
//

import UIKit

extension UIViewController {
    
    func displayAlert(title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
}
