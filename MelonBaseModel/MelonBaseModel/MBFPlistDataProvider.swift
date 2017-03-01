//
//  MBFPlistDataProvider.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 01/03/2017.
//  Copyright © 2017 Melon. All rights reserved.
//

import Foundation

open class MBFPListDataProvider {
  
  func readDictionaryFromResource(_ resource: String) -> Dictionary<String, Any>? {
    var result: Dictionary<String, Any>?
    
    if let path = Bundle.main.path(forResource: resource,
                                   ofType: "plist") {
      
      result = NSDictionary(contentsOfFile: path) as? Dictionary<String, Any>
    }
    
    return result;
  }
  
  func readArrayFromResource(_ resource: String) -> Array<Any>? {
    var result: Array<Any>?
    
    if let path = Bundle.main.path(forResource: resource,
                                   ofType: "plist") {
      
      result = NSArray(contentsOfFile: path) as? Array<Any>
    }
    
    return result;
  }
}
