//
//  FilterViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

protocol SelectFilters {
    func selectedFilters(filters:Array<Bool>)
}

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myTableView: UITableView!
    
    var delegate: SelectFilters!
    
    let leadtimeArr = ["FOURTEEN_OR_LESS_DAYS", "NINE_OR_LESS_DAYS", "SIX_OR_LESS_DAYS", "THREE_OR_LESS_DAYS"]
    let makerValuesArr = ["CHARITABLE", "ECO_FRIENDLY", "NOT_SOLD_ON_AMAZON", "HAND_MADE", "MADE_IN_USA"]
    var makerValuesSelected = [false, false, false, false, false]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Faire"
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
    }
    
    static func initWith(filters: Array<Bool>) -> FilterViewController {
        let vc = FilterViewController(nibName: nil, bundle: nil)
        
        vc.makerValuesSelected = filters
        
        return vc
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return makerValuesArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        
        cell.setFilter(filter:makerValuesArr[indexPath.row], touched: makerValuesSelected[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        makerValuesSelected[indexPath.row] = !makerValuesSelected[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        
        cell.setFilter(filter:makerValuesArr[indexPath.row], touched: makerValuesSelected[indexPath.row])
        tableView.reloadData()
    }
    
    //MARK: - Selectors
    
    @objc func done(){
        delegate.selectedFilters(filters: makerValuesSelected)
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
