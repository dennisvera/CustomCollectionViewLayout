//
//  CustomViewLayout.swift
//  Character Collector
//
//  Created by Michael Briscoe on 2/6/17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import UIKit

class CustomViewLayout: UICollectionViewLayout {
  
  var numberOfColumns = 0
  var cache = [UICollectionViewLayoutAttributes]()
  fileprivate var contentHeight: CGFloat = 0
  fileprivate let cellHeight: CGFloat = 300.0
  fileprivate var width: CGFloat {
    get {
      return collectionView!.bounds.width
    }
  }
  
  override var collectionViewContentSize : CGSize {
    return CGSize(width: width, height: contentHeight)
  }
  
  override func prepare() {
    if cache.isEmpty {
      let columnWidth = width / CGFloat(numberOfColumns)
      
      var xOffsets = [CGFloat]()
      for column in 0..<numberOfColumns {
        xOffsets.append(CGFloat(column) * columnWidth)
      }
      
      var yOffsets = [CGFloat](repeating: 0, count: numberOfColumns)
      
      var column = 0
      for item in 0..<collectionView!.numberOfItems(inSection: 0) {
        let indexPath = IndexPath(item: item, section: 0)
        let frame = CGRect(x: xOffsets[column], y: yOffsets[column], width: columnWidth, height: cellHeight)
        
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        attributes.frame = frame
        cache.append(attributes)
        
        contentHeight = max(contentHeight, frame.maxY)
        yOffsets[column] = yOffsets[column] + cellHeight
        column = column >= (numberOfColumns - 1) ? 0 : column + 1
      }
    }
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    var layoutAttributes = [UICollectionViewLayoutAttributes]()
    for attributes in cache {
      if attributes.frame.intersects(rect) {
        layoutAttributes.append(attributes)
      }
    }
    return layoutAttributes
  }
  
  
  
  
  
  
  
  
  
  

}
