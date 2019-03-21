//
//  HomeViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 21/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
   
    @IBOutlet weak var collection: UICollectionView!
    
    var itens: Array<Brand> = []
    var page = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Faire"
        
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
        WebService.getMakersWithFilters(leadTime: 0, makerValues: [], page: page, category: nil, serviceBlock: { (result: Dictionary<String, Any>) in
            self.itens += Brand.createBrandArray(array: result["brands"] as! Array<Dictionary<String, Any>>)
            
            self.collection.reloadData()
        })
    }

}
