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
    
    static func goToPreFilter(context:UIViewController, filterVC: FilterViewController, categoriesVC: CategoriesViewController){
        let VC = PreFilterViewController.initWith(filterVC: filterVC, categoriesVC:categoriesVC) as PreFilterViewController
        self.navigateToViewController(newVC: VC, context: context)
    }
    
    static func goToFilter(context:UIViewController, filterVC: FilterViewController){
        self.navigateToViewController(newVC: filterVC, context: context)
    }
    
    static func goToCategories(context:UIViewController, categoriesVC: CategoriesViewController){
        self.navigateToViewController(newVC: categoriesVC, context: context)
    }
    
    static func goToProducts(context:UIViewController, brand: Brand){
        let VC = ProductsViewController.initWith(brand: brand) as ProductsViewController
        self.navigateToViewController(newVC: VC, context: context)
    }
    
}
