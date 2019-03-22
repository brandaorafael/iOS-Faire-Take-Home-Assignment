//
//  CategoriesViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

protocol SelectCategory {
    func selectedCategory(category:String?)
}

class CategoriesViewController: UIViewController {

    var myTableView: UITableView!
    
    var delegate: SelectCategory!
    
    var categories:Array<Category> = []
    var category:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "baseline_check_black"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UINib.init(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "FilterCell")
//        myTableView.dataSource = self
//        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        WebService.getAvailableCategories(serviceBlock: { (result: Dictionary<String, Any>) in
            self.categories = Category.createCategoryArray(array: result["result"] as! Array<Dictionary<String, Any>>)
            print("g")
        })
    }
    
    static func initWith(category: String?) -> CategoriesViewController {
        let vc = CategoriesViewController(nibName: nil, bundle: nil)
        
        vc.category = category
        
        return vc
    }
    
    @objc func done(){
        delegate.selectedCategory(category: category)
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
