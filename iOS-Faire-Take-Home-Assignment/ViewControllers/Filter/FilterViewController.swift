//
//  FilterViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

protocol SelectFilters {
    func selectedFilters(makerValues:Array<Bool>, leadTimeIndex: Int?)
}

class FilterViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myTableView: UITableView!
    
    var delegate: SelectFilters!
    
    var leadTimeIndex:Int?
    let leadtimeArr = ["FOURTEEN_OR_LESS_DAYS", "NINE_OR_LESS_DAYS", "SIX_OR_LESS_DAYS", "THREE_OR_LESS_DAYS"]
    var leadtimeSelected = [false, false, false, false]
    let makerValuesArr = ["CHARITABLE", "ECO_FRIENDLY", "NOT_SOLD_ON_AMAZON", "HAND_MADE", "MADE_IN_USA"]
    var makerValuesSelected = [false, false, false, false, false]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let leadTimeIndex: Int = leadTimeIndex {
            leadtimeSelected[leadTimeIndex] = true
        }
        
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
    
    static func initWith(filters: Array<Bool>, leadTimeIndex: Int?) -> FilterViewController {
        let vc = FilterViewController(nibName: nil, bundle: nil)
        
        vc.makerValuesSelected = filters
        vc.leadTimeIndex = leadTimeIndex
        
        return vc
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Maker Values"
        }
        
        return "Lead Time"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0) {
            return makerValuesArr.count
        }
        return leadtimeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        
        if(indexPath.section == 0){
            cell.setFilter(filter:makerValuesArr[indexPath.row], touched: makerValuesSelected[indexPath.row], unique: false)
        } else {
            cell.setFilter(filter:leadtimeArr[indexPath.row], touched: leadtimeSelected[indexPath.row], unique: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "FilterCell", for: indexPath) as! FilterCell
        if(indexPath.section == 0){
            makerValuesSelected[indexPath.row] = !makerValuesSelected[indexPath.row]
            
//            cell.setFilter(filter:makerValuesArr[indexPath.row], touched: makerValuesSelected[indexPath.row], unique: false)
        } else {
            leadtimeSelected = [false, false, false, false]
            leadtimeSelected[indexPath.row] = true
        }
        tableView.reloadData()
    }
    
    //MARK: - Selectors
    
    @objc func done(){
        delegate.selectedFilters(makerValues: makerValuesSelected, leadTimeIndex:leadtimeSelected.index(of: true))
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }

}
