//
//  MDataProvider.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 20/12/2020.
//  Copyright © 2020 Melon. All rights reserved.
//

import Foundation

public typealias DataIsReadyHandler = () -> Void
public typealias ShouldRefresh = () -> Bool

public protocol MDataProtocol {
  associatedtype T
  associatedtype E
  
  var collection: T? { get }
  var filter: ((E)  -> Bool)? { get set }
  
  var dataIsReady: DataIsReadyHandler? { get set }
  
  func load()
  func clear()
}

public protocol MDataProviderProtocol: MDataProtocol {
  var shouldRefresh: ShouldRefresh? { get set }
  
  func save()
  func download()
}




/*
open class MBaseDataProvider {
  
  private(set) var collection: [[String: Any]]?
  private(set) var filtered: [[String: Any]]?
  private var localFileUrl: URL?
  private(set) var fromResource: Bool = false
  
  public var availableData: DataIsReadyHandler?
  
  public init(fileName: String) {
    self.localFileUrl = FileManager.default.urls(for: .documentDirectory,
                                                 in: .userDomainMask)[0]
    self.localFileUrl?.appendPathComponent(fileName)
    self.fromResource = false
  }
  
  public init(resource name: String) {
    if let url = Bundle.main.url(forResource: name,
                                 withExtension: "plist") {
      self.localFileUrl = url
      self.fromResource = true
    }
  }
  
  //MARK: - Collection
  public func set(collection: [[String: Any]]?) {
    self.collection = collection
    self.filtered = self.collection
  }
  
  public func numberOfItems() -> Int {
    
    return self.filtered?.count ?? 0
  }
  
  public func filter(_ filter: ([String: Any]) -> Bool) {
    self.filtered = self.collection?.filter(filter)
  }
  
  public func numberOfChildren(for key: String, at index: Int) -> Int {
    
    return (self.filtered?[index][key] as? Array<Any>)?.count ?? 0
  }
  
  public func exists(childsFor key: String, at index: Int) -> Bool {
    
    return (self.filtered?[index][key] as? Array<Any>)?.count ?? 0 > 0
  }
  
  //MARK: - Data access
  public func get(valueFor key: String,at index: Int) -> Any? {
    
    return self.filtered?[index][key]
  }
  
  public func get(valueFor key: String,
                  at y: Int,
                  inParent parentKey:String,
                  at x: Int) -> Any? {
    
    return (self.filtered?[x][parentKey] as? Array<Dictionary<String, Any>>)?[y][key]
  }
  
  public func set(value: Any, for key: String, at index: Int) {
    self.filtered?[index][key] = value
  }
  
  public func set(value: Any,
                  forRoot rootKey: String,
                  at x: Int,
                  andChild childKey: String,
                  at y: Int) {
    
    var dict = (self.filtered?[x][childKey] as? [[String: Any]])?[y]
    dict?[rootKey] = value
  }
  
  
  //MARK: - Data loading
  //MARK: Remote
  open func downloadData() {
  }
  
  //MARK: Local
  open func readData() {
    do {
      if self.haveLocalData,
         let url = self.localFileUrl {
        if self.fromResource {
          self.collection = NSArray(contentsOf: url) as? [[String: Any]]
          self.filtered = self.collection
          self.availableData?(nil)
        } else {
          var data: Data
          try data = Data(contentsOf: url)
          self.collection =
            NSKeyedUnarchiver.unarchiveObject(with: data) as? Array<Dictionary<String,Any>>
          self.filtered = self.collection
          self.availableData?(nil)
        }
      } else {
        self.downloadData()
      }
    } catch {
      
    }
  }
  
  private var haveLocalData: Bool {
    var result = false
    
    if let url = self.localFileUrl {
      result = FileManager.default.fileExists(atPath: url.path)
    }
    
    return result
  }
  
  public func saveData() {
    if let collection = self.filtered,
       let url = self.localFileUrl {
      
      FileManager.default.createFile(atPath: url.path,
                                     contents: NSKeyedArchiver.archivedData(withRootObject: collection),
                                     attributes: nil)
    }
  }
  
  public func clearData() {
    do {
      if self.haveLocalData,
         let url = self.localFileUrl {
        try FileManager.default.removeItem(atPath: url.path)
      }
    } catch {
      
    }
  }
}
 */
