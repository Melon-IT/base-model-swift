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

public class MBFBaseManager {
  
  public weak var actionStateDelegate: MBFActionStateProtocol?
  
  public init() {}
  
  public static var isIPhone: Bool {
    
    return (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone)
  }
  
  public static var isIPad: Bool {
    
    return (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad)
  }
  
  public static var isIPhone3_5Inch: Bool {
    
    return (UIScreen.mainScreen().bounds.size.height == 480)
  }
  
  public static var isIPhone4Inch: Bool {
    
    return (UIScreen.mainScreen().bounds.size.height == 568)
  }
  
  public static var isIPhone4_7Inch: Bool {
    
    return (UIScreen.mainScreen().bounds.size.height == 667)
  }
  
  public static var isIPhone5_5Inch: Bool {
    
    return (UIScreen.mainScreen().scale == 3)
  }
  
}
