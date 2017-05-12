//
//  RoundedCharacterCell.swift
//  Character Collector
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

class RoundedCharacterCell: UICollectionViewCell {
  @IBOutlet weak var characterImage: UIImageView!
  @IBOutlet weak var characterTitle: UILabel!
  @IBOutlet weak var characterInfo: UILabel!
  
  var character: Characters? {
    didSet {
      if let theCharacter = character {
        characterImage.image = UIImage(named: theCharacter.name)
        characterTitle.text = theCharacter.title
        characterInfo.text = theCharacter.description
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    
    self.layer.cornerRadius = self.frame.size.width * 0.125
    self.layer.borderWidth = 6
    self.layer.borderColor = UIColor(red: 0.5, green: 0.47, blue: 0.25, alpha: 1.0).cgColor
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    characterImage.image = nil
    characterTitle.text = ""
    characterInfo.text = ""
  }
  

}
