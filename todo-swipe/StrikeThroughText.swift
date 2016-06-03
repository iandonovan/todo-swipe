//
//  StrikeThroughText.swift
//  todo-swipe
//
//  Created by Smashing Boxes on 6/3/16.
//  Copyright © 2016 Smashing Boxes. All rights reserved.
//

import UIKit
import QuartzCore

class StrikeThroughText: UILabel {
  let strikeThroughLayer: CALayer
  // A boolean value that determines whether the label should have a strikethrough
  var strikeThrough: Bool {
    didSet {
      strikeThroughLayer.hidden = !strikeThrough
      if strikeThrough {
        resizeStrikeThrough()
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(frame: CGRect) {
    strikeThroughLayer = CALayer()
    strikeThroughLayer.backgroundColor = UIColor.whiteColor().CGColor
    strikeThroughLayer.hidden = true
    strikeThrough = false
    
    super.init(frame: frame)
    layer.addSublayer(strikeThroughLayer)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    resizeStrikeThrough()
  }
  
  let kStrikeOutThickness: CGFloat = 2.0
  func resizeStrikeThrough() {
    let textSize = text!.sizeWithAttributes([NSFontAttributeName: font])
    strikeThroughLayer.frame = CGRect(x: 0, y: bounds.size.height/2, width: textSize.width, height: kStrikeOutThickness)
  }
}
