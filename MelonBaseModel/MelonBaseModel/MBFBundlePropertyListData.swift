//
//  MBFPlistDataProvider.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 01/03/2017.
//  Copyright © 2017 Melon. All rights reserved.
//

import Foundation

open class  MBFBundlePropertyListDictionaryData: MBFDataReader {
  public var resource: String?
  public var data: Any?
  
  public func read() {
    if let path = Bundle.main.path(forResource: resource,
                                   ofType: "plist") {
      
      self.data = NSDictionary(contentsOfFile: path) as? Dictionary<String, Any>
    }
  }

  public func clean() {
    self.data = nil;
  }
}

open class MBFBundlePropertyListArrayData: MBFDataReader {
  public var resource: String?
  public var data: Any?
  
  public func read() {
    if let path = Bundle.main.path(forResource: resource,
                                   ofType: "plist") {
      
      self.data = NSArray(contentsOfFile: path) as? Array<Any>
    }
  }
  
  public func clean() {
    self.data = nil;
  }
}
