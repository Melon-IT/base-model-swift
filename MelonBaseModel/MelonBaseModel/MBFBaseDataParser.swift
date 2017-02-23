//
//  MBFBaseDataParser.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 10/06/16.
//  Copyright © 2016 Melon-IT. All rights reserved.
//

import Foundation

public class MBFBaseDataParser {
  
  public init() {
    
  }
  
  public func loadData() {
    
  }
  
  public func saveData() {
    
  }
  
  public func parseData(data: AnyObject?) {
    
  }
  
  public func loadFromDefaults(key: String) -> AnyObject? {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    return defaults.objectForKey(key)
  }
  
  public func saveToDefaults(key: String, object: AnyObject?) {
    let defaults = NSUserDefaults.standardUserDefaults()
    
    defaults.setObject(object, forKey: key)
    defaults.synchronize()
  }
  
  public func uniqueUserKey(userId: String,
                            separator: String,
                            suffix: String) -> String {
    
    return "\(userId)\(separator)\(suffix)"
  }
  
}
