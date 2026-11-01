//
//  ColumnFlowLayout.swift
//  ProductCollectionView
//
//  Created by Zülal Nebin on 2.11.2026.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    
    let columnCount: Int
    let heightRatio: CGFloat = (3.0 / 2.0)
    
    init(columnCount: Int, minColumnSpacing: CGFloat = 0, minRowSpacing: CGFloat = 0) {
        self.columnCount = columnCount
        super.init()
        
        self.minimumInteritemSpacing = minColumnSpacing
        self.minimumLineSpacing = minRowSpacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let spacings = collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(columnCount - 1)
        
        let itemWidth = ((collectionView.bounds.size.width - spacings) / CGFloat(columnCount)).rounded(.down)
        let itemHeight = itemWidth * heightRatio
        
        itemSize = CGSize(width: itemWidth, height: itemHeight)
    }
}
