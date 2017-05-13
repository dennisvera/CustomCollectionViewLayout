//
//  StretchyHeaderLayout.swift
//  Character Collector
//
/*
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class StretchyHeaderAttributes: UICollectionViewLayoutAttributes {
  
  var deltaY: CGFloat = 0
  
  override func copy(with zone: NSZone?) -> Any {
    let copy = super.copy(with: zone) as! StretchyHeaderAttributes
    copy.deltaY = deltaY
    return copy
  }
  
  override func isEqual(_ object: Any?) -> Bool {
    if let attributes = object as? StretchyHeaderAttributes {
      if attributes.deltaY == deltaY {
        return super.isEqual(object)
      }
    }
    return false
  }
}

class StretchyHeaderLayout: UICollectionViewFlowLayout {
  
  var maximumStretchHeight: CGFloat = 0
  
  override class var layoutAttributesClass : AnyClass {
    return StretchyHeaderAttributes.self
  }
  
  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    let layoutAttributes = super.layoutAttributesForElements(in: rect)! as! [StretchyHeaderAttributes]
    let offset = collectionView!.contentOffset
    if (offset.y < 0) {
      let deltaY = fabs(offset.y)
      for attributes in layoutAttributes {
        if let elementKind = attributes.representedElementKind {
          if elementKind == UICollectionElementKindSectionHeader {
            var frame = attributes.frame
            frame.size.height = min(max(0, headerReferenceSize.height + deltaY), maximumStretchHeight)
            frame.origin.y = frame.minY - deltaY
            attributes.deltaY = deltaY
            attributes.frame = frame
          }
        }
      }
    }
    return layoutAttributes
  }
  
  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }
}

