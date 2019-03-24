//
//  Helper.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 24/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    
    static func apiError(navigation: UINavigationController){
        let alertController = UIAlertController(title: "Error", message:
            "Your request found no results", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Back", style: UIAlertAction.Style.default,handler: { action in
            navigation.popViewController(animated: true)
        }))
        
        navigation.present(alertController, animated: true, completion: nil)
    }
}
