/*
* Copyright (c) 2015 Pontus Armini
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
* OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
* THE SOFTWARE.
*/
public typealias CCUtilBlock = Void -> ()

public extension CCNode {
  
  /**
  Run a block of code after specified delay
  - parameter delay: The time to pass before running the block. 
  - parameter runBlock: The block of code to run.
  */
  public func afterDelay(delay: CCTime, runBlock: CCUtilBlock) {
    let delayAction = CCActionDelay(duration: delay)
    let runBlock = CCActionCallBlock(block: runBlock)
    runAction(CCActionSequence(array: [delayAction,runBlock]))
  }
  /**
  Run an array of actions in a sequence
  - parameter actions: An array of CCActions
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime]) {
    let sequence = CCActionSequence(array: actions)
    runAction(sequence)
  }
  /**
  Run an array of actions simultaneously
  - parameter actions: An array of CCActions
  */
  public func runParallelActions(actions: [CCActionFiniteTime]) {
    let spawn = CCActionSpawn(array: actions)
    runAction(spawn)
  }
  /**
  Run an action with easing (CCActionEase).
  - parameter action: The action to run (must be a CCActionInterval subclass) 
  - parameter easing: The easing type (defined by the custom EasingType enum that matches the different easing subclasses, example usage: .BounceIn).
  - parameter periodOrRate: An optional period or rate float value. This argument is only applicable on easing types for which you can specify either a rate or period. Pass nil if not needed.
  */
  public func runAction(action:CCActionInterval, withEasing easing: EasingType, andPeriodOrRate r: Float?) {
    runAction(easing.easedAction(action, periodRate: r))
  }
  /**
  Run an action with easing (CCActionEase). If you need to specify a rate or period, use `runAction:withEasing:andPeriodOrRate:`
  - parameter action: The action to run (must be a CCActionInterval subclass)
  - parameter easing: The easing type (defined by the custom EasingType enum that matches the different easing subclasses, example usage: .BounceIn).
  */
  public func runAction(action:CCActionInterval, withEasing easing: EasingType) {
    runAction(easing.easedAction(action, periodRate: nil))
  }
  
}

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
