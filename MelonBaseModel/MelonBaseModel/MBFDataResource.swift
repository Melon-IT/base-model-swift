//
//  MBFDataResource.swift
//  MelonBaseModel
//
//  Created by Tomasz Popis on 02/03/2017.
//  Copyright © 2017 Melon. All rights reserved.
//

import Foundation

public protocol MBFDataResource {
  var resource: String? {set get}
  var data: Any? {get}
}

public protocol MBFDataReader: MBFDataResource  {
  func read()
  func clean()
}

public protocol MBFDataWriter {
  func write()
  func delete()
}
