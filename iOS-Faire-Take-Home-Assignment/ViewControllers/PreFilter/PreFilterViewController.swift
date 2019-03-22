//
//  PreFilterViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class PreFilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var filterVC:FilterViewController!
    var categoriesVC:CategoriesViewController!
    
    var itens = ["Categories", "Filters"]
    var myTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myTableView.dataSource = self
        myTableView.delegate = self
        self.view.addSubview(myTableView)
        
    }
    
    static func initWith(filterVC: FilterViewController, categoriesVC: CategoriesViewController) -> PreFilterViewController {
        let vc = PreFilterViewController(nibName: nil, bundle: nil)
        
        vc.filterVC = filterVC
        vc.categoriesVC = categoriesVC
        
        return vc
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = itens[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            Coordinator.goToCategories(context: self.navigationController!, categoriesVC: categoriesVC)
        } else {
            Coordinator.goToFilter(context:self.navigationController!, filterVC: filterVC)
        }
    }

}
