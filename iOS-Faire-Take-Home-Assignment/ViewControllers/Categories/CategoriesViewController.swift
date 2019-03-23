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

class CategoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    var myTableView: UITableView!
    
    var delegate: SelectCategory!
    
    var categories:Array<Category> = []
    var category:String?
    var categoriesSelected = Array<Bool>.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "baseline_check_black"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(done))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UINib.init(nibName: "FilterCell", bundle: nil), forCellReuseIdentifier: "FilterCell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
        WebService.getAvailableCategories(serviceBlock: { (result: Dictionary<String, Any>) in
            self.categories = Category.createCategoryArray(array: result["result"] as! Array<Dictionary<String, Any>>)
            self.categoriesSelected = Array(repeating: false, count: self.categories.count)
            
            if let category: String = self.category {
                
                self.categoriesSelected[self.categories.index(where: { (c) -> Bool in
                    c.name == category // test if this is the item you're looking for
                })!] = true
            }
            
            self.myTableView.reloadData()
        })
    }
    
    static func initWith(category: String?) -> CategoriesViewController {
        let vc = CategoriesViewController(nibName: nil, bundle: nil)
        
        vc.category = category
        
        return vc
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        
        cell.setFilter(filter:categories[indexPath.row].name, touched: categoriesSelected[indexPath.row], unique: true)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(categoriesSelected[indexPath.row] == true){
            categoriesSelected = Array(repeating: false, count: self.categories.count)
        } else {
            categoriesSelected = Array(repeating: false, count: self.categories.count)
            categoriesSelected[indexPath.row] = true
        }
        
        tableView.reloadData()
    }
    
    @objc func done(){
        if let n = categoriesSelected.index(of: true) {
            delegate.selectedCategory(category: categories[n].name)
        }
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
