//
//  ViewController.swift
//  ProductCollectionView
//
//  Created by Zülal Nebin on 1.11.2026.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // Ürün resmi, başlığı, kısa açıklaması ve fiyatı bulunan ürünlerin iki sütun halinde listelenmesi
    
    @IBOutlet weak var productsCollectionView: UICollectionView!
    var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var p = Product()
        p.title = "Milk"
        p.price = 15
        p.shortDescription = "Fresh, creamy milk, rich in calcium and protein."
        p.image = "milk"
        
        productList.append(p)
        
        p = Product()
        p.title = "Soda"
        p.price = 20
        p.shortDescription = "Refreshing carbonated drink with a crisp, bubbly taste."
        p.image = "soda"
        
        productList.append(p)

        p = Product()
        p.title = "Orange Juice"
        p.price = 35
        p.shortDescription = "Fresh and tangy orange juice, packed with vitamin C."
        p.image = "orange-juice"
        
        productList.append(p)

        p = Product()
        p.title = "Mango Juice"
        p.price = 40
        p.shortDescription = "Sweet and tropical mango juice with a smooth taste."
        p.image = "mango-juice"
        
        productList.append(p)
        
        productsCollectionView.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
        productsCollectionView.collectionViewLayout = ColumnFlowLayout(columnCount: 2, minColumnSpacing: 10, minRowSpacing: 20)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        
        let p = productList[indexPath.row]
        
        cell.titleLabel.text = p.title
        cell.shortDescriptionLabel.text = p.shortDescription
        cell.priceLabel.text = "\(p.price!) TL"
        cell.productImageView.image = UIImage(named: p.image!)
        
        return cell
        
    }

}

