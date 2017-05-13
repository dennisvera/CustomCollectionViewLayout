//
//  Characters.swift
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

class Characters {
  var name: String
  var title: String
  var description: String
  var hitPoints: Int
  var attack: String
  var damage: String
  
  init(name: String, 
       title: String, 
       description: String,
       hitPoints: Int, 
       attack: String, 
       damage: String) {
    
    self.name = name
    self.title = title
    self.description = description
    self.hitPoints = hitPoints
    self.attack = attack
    self.damage = damage
  }
  
  convenience init(dictionary: NSDictionary) {
    let name = dictionary["name"] as? String
    let title = dictionary["title"] as? String
    let description = dictionary["description"] as? String
    let hitPoints = dictionary["hitPoints"] as? Int
    let attack = dictionary["attack"] as? String
    let damage = dictionary["damage"] as? String
    
    self.init(name: name!, 
              title: title!,
              description: description!, 
              hitPoints: hitPoints!,
              attack: attack!,
              damage: damage!)
  }
  
  class func loadCharacters() -> [Characters] {
    var characters = [Characters]()
    if let path = Bundle.main.path(forResource: "Character_Data", ofType: "plist") {
      if let dictArray = NSArray(contentsOfFile: path) {
        for item in dictArray {
          let character = Characters(dictionary: item as! NSDictionary)
          characters.append(character)
        }
      }
    }
    return characters
  }
  
  
}

