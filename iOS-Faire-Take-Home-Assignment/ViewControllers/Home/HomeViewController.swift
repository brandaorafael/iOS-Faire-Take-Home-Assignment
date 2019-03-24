//
//  HomeViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, SelectFiltersDelegate, SelectCategoryDelegate {
   
    var collection: UICollectionView!
    
    var itens: Array<Brand> = []
    var page = 1
    
    var leadtimeIndex:Int?
    
    var makerValuesSelected = Array(repeating: false, count: 5)
    
    var category:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Brands"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "baseline_filter_list_black"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(filter))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        collection = UICollectionView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight), collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = UIColor.white
        collection.register(UINib.init(nibName: "HomeCell", bundle: nil), forCellWithReuseIdentifier: "HomeCell")
        collection.delegate = self
        collection.dataSource = self
        
        self.view.addSubview(collection)

        loadItens()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itens.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        
        cell.setBrand(brand: itens[indexPath.row])
        
        if indexPath.row == self.itens.count - 1 {
            page += 1
            loadMoreItens()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Coordinator.goToProducts(context: self.navigationController!, brand: itens[indexPath.row])
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
        
        var makerValues = Array<Int>.init()
        for (index, element) in makerValuesSelected.enumerated() {
            if(element){
                makerValues.append(index)
            }
        }
        
        page = 1
        
        WebService.getMakersWithFilters(leadTime: leadtimeIndex, makerValues: makerValues, page: page, category: category, serviceBlock: { (result: Dictionary<String, Any>) in
            
            self.itens = Brand.createBrandArray(array: result["brands"] as! Array<Dictionary<String, Any>>)
            
            self.collection.reloadData()
            
            self.collection.setContentOffset(CGPoint.init(x: 0, y: -(UIApplication.shared.statusBarFrame.size.height)), animated: true)
        })
    }
    
    func loadMoreItens(){
        
        var makerValues = Array<Int>.init()
        for (index, element) in makerValuesSelected.enumerated() {
            if(element){
                makerValues.append(index)
            }
        }
        
        WebService.getMakersWithFilters(leadTime: leadtimeIndex, makerValues: makerValues, page: page, category: category, serviceBlock: { (result: Dictionary<String, Any>) in
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
