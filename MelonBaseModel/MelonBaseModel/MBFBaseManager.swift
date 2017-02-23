//
//  MBFBaseManager.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 17/02/16.
//  Copyright © 2016 Melon-IT. All rights reserved.
//

import Foundation

open class MBFBaseManager {
  
  public init() {}
  
  open static var isIPhone: Bool {
    
    return (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone)
  }
  
  open static var isIPad: Bool {
    
    return (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)
  }
  
  open static var isIPhone3_5Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 480)
  }
  
  open static var isIPhone4Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 568)
  }
  
  open static var isIPhone4_7Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 667)
  }
  
  open static var isIPhone5_5Inch: Bool {
    
    return (UIScreen.main.scale == 3)
  }
  
}
