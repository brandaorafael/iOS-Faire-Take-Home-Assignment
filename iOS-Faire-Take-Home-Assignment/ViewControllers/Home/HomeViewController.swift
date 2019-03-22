//
//  HomeViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SelectFilters, SelectCategory {
   
    @IBOutlet weak var collection: UICollectionView!
    
    var itens: Array<Brand> = []
    var page = 1
    
    var leadtimeIndex:Int?
    var makerValuesArr = Array<String>.init()
    
    var makerValuesSelected = [false, false, false, false, false]
    
    var category:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Faire"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "baseline_filter_list_black"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(filter))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
        collection.register(UINib.init(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        collection.delegate = self
        collection.dataSource = self

        loadItens()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        if(itens[indexPath.row].images.count > 1){
            cell.setBackground(url: itens[indexPath.row].images[1].url, name: itens[indexPath.row].name)
        } else {
            cell.setBackground(url: itens[indexPath.row].images[0].url, name: itens[indexPath.row].name)
        }
        
        if indexPath.row == self.itens.count - 1 {
            page += 1
            loadItens()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  50
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func loadItens(){
        
        let leadtimeArr = ["FOURTEEN_OR_LESS_DAYS", "NINE_OR_LESS_DAYS", "SIX_OR_LESS_DAYS", "THREE_OR_LESS_DAYS"]

        var makerValues = Array<Int>.init()
        for (index, element) in makerValuesSelected.enumerated() {
            if(element){
                makerValues.append(index)
            }
        }
        
        WebService.getMakersWithFilters(leadTime: 0, makerValues: makerValues, page: page, category: category, serviceBlock: { (result: Dictionary<String, Any>) in
            self.itens += Brand.createBrandArray(array: result["brands"] as! Array<Dictionary<String, Any>>)
            
            self.collection.reloadData()
        })
    }
    
    //MARK: - Selectors
    
    @objc func filter(){
        let filterVC = FilterViewController.initWith(filters: makerValuesSelected, leadTimeIndex: leadtimeIndex)
        filterVC.delegate = self
        
        let categoriesVC = CategoriesViewController.initWith(category: category)
        categoriesVC.delegate = self
        
        Coordinator.goToPreFilter(context: self.navigationController!, filterVC: filterVC, categoriesVC: categoriesVC)
    }
    
    func selectedFilters(makerValues: Array<Bool>, leadTimeIndex: Int?) {
        self.leadtimeIndex = leadTimeIndex
        makerValuesSelected = makerValues
        loadItens()
    }

    func selectedCategory(category: String?) {
        self.category = category
        loadItens()
    }
}
