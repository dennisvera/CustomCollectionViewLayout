//
//  CharacterFlowLayout.swift
//  Character Collector
//
//  Created by Flatiron School on 5/10/17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import UIKit

class CharacterFlowLayout: UICollectionViewFlowLayout {
    let standardItemAlpha: CGFloat = 0.5
    let standardItemScale: CGFloat = 0.5

    
    override func prepare() {
        super.prepare()
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttribute in attributes! {
            let itemAttributesCopy = itemAttribute.copy() as! UICollectionViewLayoutAttributes
            
            changeLayoutAttributes(itemAttributesCopy)
            attributesCopy.append(itemAttributesCopy)
        }
        
        return attributesCopy
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.height/2
        let offSet = collectionView!.contentOffset.y
        let normalizedCenter = attributes.center.y - offSet
        
        let maxDistance = self.itemSize.height + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        let alpha = ratio * (1 - standardItemAlpha) + self.standardItemAlpha
        let scale = ratio * (1 - standardItemScale) + self.standardItemScale
        
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
}
