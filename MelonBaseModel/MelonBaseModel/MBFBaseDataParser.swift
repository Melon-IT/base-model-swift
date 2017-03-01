//
//  MBFBaseDataParser.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 10/06/16.
//  Copyright © 2016 Melon. All rights reserved.
//

import Foundation

public protocol MBFDataParserProtocol {
  
  var parserDataListener: MBFParserDataListener? {set get}
  
  var data: Any? {set get}
  
  func clear()
  func load()
  func save()
  func delete()
  func parse()
  func parse(completionHandler: ((Bool) -> Void)?)
}

public protocol MBFParserDataListener: class {
  func dataDidParse(success: Bool, type: UInt?)
}

open class MBFBaseDataParser {
  
  public init() {
    
  }
  
  open func loadData() {
    
  }
  
  open func saveData() {
    
  }
  
  open func parseData(data: AnyObject?) {
    
  }
  
  open func loadFromDefaults(key: String) -> AnyObject? {
    let defaults = UserDefaults.standard
    
    return defaults.object(forKey: key) as AnyObject?
  }
  
  open func saveToDefaults(key: String, object: AnyObject?) {
    let defaults = UserDefaults.standard
    
    defaults.set(object, forKey: key)
    defaults.synchronize()
  }
  
  open func uniqueUserKey(userId: String,
                            separator: String,
                            suffix: String) -> String {
    
    return "\(userId)\(separator)\(suffix)"
  }
  
}
