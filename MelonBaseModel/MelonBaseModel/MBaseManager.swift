//
//  MBFBaseManager.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 17/02/16.
//  Copyright © 2016 Melon. All rights reserved.
//

import Foundation

public protocol MActionCompletionProtocol: class {
  func action(success: Bool, type: UInt?, message: Any?)
}

open class MBaseManager {
  
  open weak var actionCompletionDelegate: MActionCompletionProtocol?
  
  //open var dataParser: MDataParserProtocol?
  
  public init() {}
  
  public static var isIPhone: Bool {
    
    return (UIDevice.current.userInterfaceIdiom == .phone)
  }
  
  public static var isIPad: Bool {
    
    return (UIDevice.current.userInterfaceIdiom == .pad)
  }
  
  public static var isTv: Bool {
    
    return UIDevice.current.userInterfaceIdiom == .tv
  }
  
  public static var isIPhone3_5Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 480)
  }
  
  public static var isIPhone4Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 568)
  }
  
  public static var isIPhone4_7Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 667)
  }
  
  public static var isIPhone5_5Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 736)
  }
  
  public static var isIPhone5_8Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 812)
  }
  
  public static var isIPhone6_1_5Inch: Bool {
    
    return (UIScreen.main.bounds.size.height == 896)
  }
  
  public func observeBaterryLevel() {
    
    UIDevice.current.isBatteryMonitoringEnabled = true
    
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(batteryLevelDidChange),
                                           name: UIDevice.batteryLevelDidChangeNotification,
                                           object: nil)
  }
  
  @objc func batteryLevelDidChange(_ notification: Notification) {
    //UIDevice.current.batteryLevel
  }
  
}
