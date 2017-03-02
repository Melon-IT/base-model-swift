//
//  MBFBaseDataParser.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 10/06/16.
//  Copyright © 2016 Melon. All rights reserved.
//

import Foundation

/*
public protocol MBFDataParserProtocol {
  
  var parserDataListener: MBFParserDataListener? {set get}
  
  var resource: Any? {set get}
  
  func load()
  func save()
  func clear()
  func delete()
  func parse(completionHandler: ((Bool) -> Void)?)
}

public protocol MBFParserDataListener {
  func dataDidParse(success: Bool, type: UInt?)
}
*/

open class MBFPropertyListDataFactory {
  
  open class func bundlePropertyListArray<Type>(resource: String) -> MBFPropertyListArray<Type> {
    
    let result = MBFPropertyListArray<Type>()
    result.plistDataReader = MBFBundlePropertyListDataReader()
    result.plistDataReader?.resource = resource
    
    return result
  }
}

open class MBFPropertyListArray<Type> {
  
  open var plistDataReader: MBFDataReader?
  
  
  public var data: Array<Type>? {
    
    return self.plistDataReader?.data as? Array<Type>
  }
  
  public init() {
  }
  
  open func load() {
    self.plistDataReader?.read();
  }
  
  open var numberOfItems: Int {
    var result = 0;
    if let array = self.data {
      result = array.count
    }
    
    return result;
  }
  
  open subscript(index: Int) -> Type? {
    get {
      var result: Type?

      if let array = self.data,
        index >= 0 && index < array.count {
        result = array[index]
      }
      
      return result
    }
    
    set {}
  }

}

/*
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
   */
