//
//  HomeViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var itens: Array<Brand> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        WebService.getMakersWithFilters(leadTime: 0, makerValues: [], page: 1, category: nil, serviceBlock: { (result: Dictionary<String, Any>) in
            self.itens = Brand.createBrandArray(array: result["brands"] as! Array<Dictionary<String, Any>>)
            
        })
    }

}
