//
//  MPListDataProvider.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 12/03/2021.
//  Copyright © 2021 Melon. All rights reserved.
//

import Foundation

open class MPropertyListDataProvider<T, E>: MDataProviderProtocol {
  
  public var collection: T?
  public var filter: ((E) -> Bool)?
  
  public var dataIsReady: DataIsReadyHandler?
  public var shouldRefresh: (() -> Bool)?
  
  public private(set) var localUrl: URL
  public private(set) var fromResource: Bool
  
  public init?(forResource name: String) {
    if let url = Bundle.main.url(forResource: name, withExtension: "plist") {
      self.localUrl = url
      self.fromResource = true
    } else {
      return nil
    }
  }
  
  public init(forFile name: String) {
    var url = FileManager.default.urls(for: .documentDirectory,
                                       in: .userDomainMask)[0]
    url.appendPathComponent(name)
    
    self.localUrl = url
    self.fromResource = false
  }
  
  public func load() {
    if self.fromResource == false,
       self.shouldRefresh?() == true {
      
      self.download()
      
    } else {
      do {
        let content =
          try Data(contentsOf:self.localUrl)
        
        let propertyList =
          try PropertyListSerialization.propertyList(from: content,
                                                     options: [],
                                                     format: nil)
        self.collection = propertyList as? T
        self.dataIsReady?()
      } catch { }
    }
  }
  
  public func clear() {
    self.collection = nil
    self.filter = nil
    self.dataIsReady?()
  }
  
  public func save() {
    if self.fromResource == false,
       let collection = self.collection {
      
      FileManager.default.createFile(atPath: self.localUrl.path,
                                     contents: NSKeyedArchiver.archivedData(withRootObject: collection),
                                     attributes: nil)
    }
  }
  
  public func download() {
    self.dataIsReady?()
  }
}
