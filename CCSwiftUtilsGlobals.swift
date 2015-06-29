//
//  CCSwiftUtilsGlobals.swift
//  Cocos2dSwiftUtils
//
//  Created by pontus armini on 2015-06-30.
//  Copyright © 2015 Pontus Armini. All rights reserved.
//


let π = CGFloat(M_PI)

/**
Ensures that the value stays between the given values, inclusive. Works with all types that conforms to the Comparable protocol.
- parameter value, min, max: The value to clamp, minimum allowed value and maximum allowed value.
- returns: A clamped value
*/
public func clamp<T:Comparable> (value: T, min: T, max: T ) -> T {
  return Swift.max(min, Swift.min(max, value))
}