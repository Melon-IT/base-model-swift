//
//  MBFBaseManager.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 17/02/16.
//  Copyright © 2016 Melon-IT. All rights reserved.
//

import Foundation

public protocol MBFActionStateProtocol: class {
  func action(success: Bool, type: UInt?, message: AnyObject?)
}

open class MBFBaseManager {
  
  public weak var actionStateDelegate: MBFActionStateProtocol?
  
  public init() {}
  
  open static var isIPhone: Bool {
    
    return (UIDevice.current.userInterfaceIdiom == .phone)
  }
  
  open static var isIPad: Bool {
    
    return (UIDevice.current.userInterfaceIdiom == .pad)
  }
  
  open static var isTv: Bool {
    
    return UIDevice.current.userInterfaceIdiom == .tv
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
