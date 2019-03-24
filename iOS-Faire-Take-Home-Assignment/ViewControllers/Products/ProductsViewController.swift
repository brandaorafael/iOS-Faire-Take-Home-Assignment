//
//  ProductsViewController.swift
//  iOS-Faire-Take-Home-Assignment
//
//  Created by Rafael Brandão on 22/03/2019.
//  Copyright © 2019 Rafael Brandão. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var collection: UICollectionView!
    
    var products:Array<Product> = []
    var brand: Brand!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = brand.name

        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        collection = UICollectionView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight), collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = UIColor.white
        collection.register(UINib.init(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "ProductCell")
        collection.delegate = self
        collection.dataSource = self
        
        self.view.addSubview(collection)
        
        loadItens()
    }
    
    static func initWith(brand: Brand) -> ProductsViewController {
        let vc = ProductsViewController(nibName: nil, bundle: nil)
        
        vc.brand = brand
        
        return vc
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        Coordinator.goToProductDetail(context: self.navigationController!, product: products[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        cell.setProduct(product: products[indexPath.row])
        
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
        
        if let token = brand.token {
            WebService.getMakerProducts(brand: token, serviceBlock: { (result: Dictionary<String, Any>) in
                self.products = Product.createProductsArray(array: result["result"] as! Array<Dictionary<String, Any>>)
                
                self.collection.reloadData()
                
                self.collection.setContentOffset(CGPoint.init(x: 0, y: -(UIApplication.shared.statusBarFrame.size.height)), animated: true)
            })
        } else {
            Helper.apiError(navigation: self.navigationController!)
        }
        
        
    }

}
