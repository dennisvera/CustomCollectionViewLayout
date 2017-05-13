//
//  CollectionHeaderView.swift
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

class CollectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var foregroundImage: UIImageView!
    @IBOutlet weak var backgroundImageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var foregroundImageHeightConstraint: NSLayoutConstraint!
    
    var backgroundImageHeight: CGFloat = 0
    var foregroundImageHeight: CGFloat = 0
    var previousHeight: CGFloat = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundImageHeight = backgroundImage.bounds.height
        foregroundImageHeight = foregroundImage.bounds.height
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        let attributes = layoutAttributes as! StretchyHeaderAttributes
        
        let height = (attributes.frame).height
        if previousHeight != height {
            backgroundImageHeightConstraint.constant = backgroundImageHeight - attributes.deltaY
            foregroundImageHeightConstraint.constant = foregroundImageHeight + attributes.deltaY
            previousHeight = height
        }
    }
}
