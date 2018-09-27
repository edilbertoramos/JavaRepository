//
//  UIViewController+AlertError.swift
//  JavaRepository
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 27/09/2018.
//  Copyright © 2018 Edilberto Ramos. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlertConnectionError(_ error: CustomError) {
        
        let alertController = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
        
    }
    
}
