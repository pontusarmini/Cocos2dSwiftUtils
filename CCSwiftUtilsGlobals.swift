//
//  CCSwiftUtilsGlobals.swift
//  Cocos2dSwiftUtils
//
//  Created by pontus armini on 2015-06-30.
//  Copyright © 2015 Pontus Armini. All rights reserved.
//

public typealias CallBackBlock = Void -> ()

let π = CGFloat(M_PI)

/**
Ensures that the value stays between the given values, inclusive. Works with all types that conforms to the Comparable protocol.
- parameter value, min, max: The value to clamp, minimum allowed value and maximum allowed value.
- returns: A clamped value
*/
public func clamp<T:Comparable> (value: T, min: T, max: T ) -> T {
  return Swift.max(min, Swift.min(max, value))
}

public enum EasingType {
  
  /**
    Enum used to specify which CCActionEase subclass to apply.
  */
  
  case BackIn
  case BackInOut
  case BackOut
  case Bounce
  case BounceIn
  case BounceInOut
  case BounceOut
  case Elastic
  case ElasticIn
  case ElasticInOut
  case ElasticOut
  case EaseRate
  case EaseIn
  case EaseInOut
  case EaseOut
  case SineIn
  case SineInOut
  case SineOut
  
  func easedAction(action:CCActionInterval, periodRate:Float?) -> CCActionEase {
    
    switch self {
    case .BackIn:
      return CCActionEaseBackIn(action: action)
    case .BackInOut:
      return CCActionEaseBackInOut(action: action)
    case .BackOut:
      return CCActionEaseBackOut(action: action)
    case .Bounce:
      return CCActionEaseBounce(action: action)
    case .BounceIn:
      return CCActionEaseBounceIn(action: action)
    case .BounceInOut:
      return CCActionEaseBounceInOut(action: action)
    case .BounceOut:
      return CCActionEaseBounceOut(action: action)
    case .Elastic:
      if let period = periodRate {
        return CCActionEaseElastic(action: action, period: period)
      } else {
        return CCActionEaseElastic(action: action)
      }
    case .ElasticIn:
      if let period = periodRate {
        return CCActionEaseElasticIn(action: action, period: period)
      } else {
        return CCActionEaseElasticIn(action: action)
      }
    case .ElasticInOut:
      if let period = periodRate {
        return CCActionEaseElasticInOut(action: action, period: period)
      } else {
        return CCActionEaseElasticInOut(action: action)
      }
    case .ElasticOut:
      if let period = periodRate {
        return CCActionEaseElasticOut(action: action, period: period)
      } else {
        return CCActionEaseElasticOut(action: action)
      }
    case .EaseRate:
      if let rate = periodRate {
        return CCActionEaseRate(action: action, rate: rate)
      } else {
        return CCActionEaseRate(action: action)
      }
    case .EaseIn:
      if let rate = periodRate {
        return CCActionEaseIn(action: action, rate: rate)
      } else {
        return CCActionEaseIn(action: action)
      }
    case .EaseInOut:
      if let rate = periodRate {
        return CCActionEaseInOut(action: action, rate: rate)
      } else {
        return CCActionEaseInOut(action: action)
      }
    case .EaseOut:
      if let rate = periodRate {
        return CCActionEaseOut(action: action, rate: rate)
      } else {
        return CCActionEaseOut(action: action)
      }
    case .SineIn:
      return CCActionEaseSineIn(action: action)
    case .SineInOut:
      return CCActionEaseSineInOut(action: action)
    case .SineOut:
      return CCActionEaseSineOut(action: action)
      
    }
  }
}
