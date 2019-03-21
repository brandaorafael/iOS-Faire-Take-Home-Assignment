//
//  Coordinator.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    
    static func navigateToViewController (newVC:UIViewController, context: UIViewController) {
        if let nav = context as? UINavigationController {
            nav.pushViewController(newVC, animated: true)
        } else {
            context.present(newVC, animated: true, completion: {})
        }
    }
    
    static func goToPreFilter(context:UIViewController){
        let VC = PreFilterViewController(nibName: nil, bundle: nil) as PreFilterViewController
        self.navigateToViewController(newVC: VC, context: context)
    }
    
}
