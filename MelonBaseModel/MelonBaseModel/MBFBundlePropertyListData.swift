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
    
    
    if let path = Bundle.main.path(forResource: self.resource, ofType: "plist"),
      let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      
      if let plist =
        try? PropertyListSerialization.propertyList(from: data,
                                                    options: [],
                                                    format: nil) {
        self.data = plist
      }
    }
  }
  
  public func clean() {
    self.data = nil;
  }
}
