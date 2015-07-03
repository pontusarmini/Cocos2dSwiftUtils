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
Ensures that the value stays between the given min/max values, inclusive. Works with all types that conforms to the `Comparable` protocol.

**Usage:**

```
var myValue = 20
myValue = clamp(myValue, min: 50, max: 100) //Now 50
```

:param: value The value (must conform to the Comparabel protocol) to be clamped
:param: min   The minium value to return
:param: max   The maximum value to return
:returns:     The clamped value.

*/
public func clamp<T:Comparable> (value: T, min: T, max: T ) -> T {
  return Swift.max(min, Swift.min(max, value))
}

public func doThis(block: CallBackBlock) -> CCActionCallBlock {
  return CCActionCallBlock(block: block)
}

public func callBack(block: CallBackBlock) -> CCActionCallBlock {
  return doThis(block)
}

public func runBlock(block: CallBackBlock) -> CCActionCallBlock {
  return doThis(block)
}
public func runClosure(block: CallBackBlock) -> CCActionCallBlock {
  return doThis(block)
}


/**
  An enum used to wrap an action inside a CCActionEase subclass.
*/
public enum EasingType {
  
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
  case EaseIn
  case EaseInOut
  case EaseOut
  case SineIn
  case SineInOut
  case SineOut
  
  /**
    This function returns an action wrapped in an easing action.
  
  **Example usage:**
  
  ```
  let easingType:EasingType = .SineIn
  let moveAction = CCActionMoveTo(duration: 2.0, position: destination)
  let easedMoveAction = easingType.easedAction(moveAction, periodRate: nil)
  ```
  
  :param: action The action that you want to be eased.
  :param: periodRate An optional float value. Can be used with the easing actions that can be controlled with a period or rate.
  :returns: An action wrapped inside a CCActionEase subclass
  */
  public func easedAction(action:CCActionInterval, periodRate:Float?) -> CCActionEase {
    
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
