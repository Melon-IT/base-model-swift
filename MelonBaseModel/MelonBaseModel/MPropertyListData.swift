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

public class MPropertyList<Type> {
  public var resourcesName: String?
  fileprivate var resources: Type?
  
  public init() {}
  
  public init(resources: String) {
    self.resourcesName = resources
  }
  
  fileprivate func readResourcesFromBundle() {
    if let path = Bundle.main.path(forResource: resourcesName, ofType: "plist"),
       let content = try? Data(contentsOf: URL(fileURLWithPath: path)) {
      
      self.resources =
       (try? PropertyListSerialization.propertyList(from: content,
                                                    options: [],
                                                    format: nil)) as? Type
    }
  }
  
  fileprivate func cleanResources() {
    self.resources = nil
  }

}

public class MBundleDictionaryPropertyList<Type>: MPropertyList<Dictionary<String,Type>>  {
  
  public func read() {
    self.readResourcesFromBundle();
  }
  
  public func clean() {
    super.cleanResources()
  }
  
  public var numberOfItems: Int {
    
    var result = 0;
    
    if let counter = self.resources?.count {
      result = counter
    }
    
    return result
  }
  
  public subscript(key: String) -> Type? {

    return self.resources?[key]
  }
}

public class MBundleArrayPropertyList<Type>: MPropertyList<Array<Type>> {
  
  public func read() {
    self.readResourcesFromBundle();
  }
  
  public func clean() {
    super.cleanResources()
  }
  
  public var numberOfItems: Int {
    
    var result = 0;
    
    if let counter = self.resources?.count {
      result = counter
    }
    
    return result
  }
  
  public subscript(index: Int) -> Type? {
      var result: Type?
      
      if let counter = self.resources?.count,
         index >= 0 && index < counter {
        result = self.resources?[index]
      }
      
      return result
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
