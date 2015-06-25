//
//  Bool+Extensions.swift
//  Cocos2dSwiftUtils
//
//  Created by pontus armini on 2015-06-25.
//  Copyright © 2015 Apportable. All rights reserved.
//


public extension Bool {
  public static func random() -> Bool {
    return (arc4random_uniform(2) == 0) ? true : false
  }
}