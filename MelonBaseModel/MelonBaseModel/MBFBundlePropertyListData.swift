//
//  MBFPlistDataProvider.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 01/03/2017.
//  Copyright © 2017 Melon. All rights reserved.
//

import Foundation

open class  MBFBundlePropertyListDataReader: MBFDataReader {
  public var resource: String?
  public var data: Any?
  
  public func read() {
    
    self.data = nil
    
    if let path = self.resource,
      let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      
      if let plistDict =
        try? PropertyListSerialization.propertyList(from: data,
                                                    options: [],
                                                    format: nil) as? Dictionary<AnyHashable,Any> {
        self.data = plistDict
        
      } else if let plistArray =
        try? PropertyListSerialization.propertyList(from: data,
                                                    options: [],
                                                    format: nil) as? Array<Any> {
        self.data = plistArray
        
      }
    }
  }
  
  public func clean() {
    self.data = nil;
  }
}
