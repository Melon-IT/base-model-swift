//
//  MBFBaseDataParser.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 10/06/16.
//  Copyright © 2016 Melon-IT. All rights reserved.
//

import Foundation

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
