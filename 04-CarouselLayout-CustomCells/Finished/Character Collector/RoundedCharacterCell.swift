//
//  RoundedCharacterCell.swift
//  Character Collector
//
//  Created by Michael Briscoe on 2/3/17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import UIKit

class RoundedCharacterCell: UICollectionViewCell {
  @IBOutlet weak var characterImage: UIImageView!
  @IBOutlet weak var characterTitle: UILabel!
  @IBOutlet var characterInfo: UILabel!
  
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
