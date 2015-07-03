//
//  CCAction+Extensions.swift
//  Cocos2dSwiftUtils
//
//  Created by pontus armini on 2015-07-03.
//  Copyright © 2015 Pontus Armini. All rights reserved.
//


public extension CCActionFiniteTime {
  
  /**
  
  Chains a new action to the action (self), effectively creating and returning a CCActionSequence.
  Equivalent to `chainedWithAction(_:)`.
  
  **Example usage:**
  
  ```
  //Chain two actions together
  myAction.and.then.runAction(anotherAction)
  
  ```
  
  :param: action The action to chain to the existing action (self)
  :returns:      A CCActionSequence with the action (self) and an appended CCAction
  
  */
  
  public func runAction(action: CCActionFiniteTime) -> CCActionSequence {
    let s = CCActionSequence(one: self, two: action)
    return s
  }

  /**
  This function can be used to run multiple actions at the same time.
  
  :param: actions An array of the actions that you want to run simultaneously as self
  :returns: A CCActionSpawn object
  
  */
  public func runSimultaneouslyWithActions(actions: [CCActionFiniteTime]) -> CCActionSpawn {
    var a = actions
    a.append(self)
    return CCActionSpawn(array: a)
  }

  /**
  This function can be used to run two actions simultaneously.
  
  :param: action The action that you want to run at the same time as self
  :returns: A CCActionSpawn object
  
  */
  public func runSimultaneouslyWithAction(action: CCActionFiniteTime) -> CCActionSpawn {
    return CCActionSpawn(one: self, two: action)
  }
  /**
  This function can be used to repeat an action n number of times
  
  :param: times The number of times to repeat the action
  :returns: A CCActionRepeat object
  */
  public func repeatTimes(times: Int) -> CCActionRepeat {
    return CCActionRepeat(action: self, times: UInt(times))
  }
  
  /**
  This function adds a delay to be run **after** the action (self).
  
  ####Example usage:
  
  ```
  let moveWaitJump = move.and.afterDelay(1.0).jump
  runAction(moveWaitJump)
  
  ```
  :param: delay The time to wait before executing the action
  :returns: a CCActionSequence with an action and a delay action
  */
  public func afterDelay(delay: CCTime) -> CCActionSequence {
    let d = CCActionDelay(duration: delay)
    let s = CCActionSequence(one: self, two: d)
    return s
  }
  
  /**
  This function adds a delay to be run **before** the action (self).
  
  ####Example usage:
  
  ```
  let move = CCActionMoveTo(duration: 2.0, position: pos)
  let delayedMove = move.delayedWith(5.0)
  runAction(delayedMove)
  
  ```
  :param: delay The time to wait before executing the action
  :returns: a CCActionSequence with a delay and action
  */
  
  public func delayedWith(delay: CCTime) -> CCActionSequence {
    let d = CCActionDelay(duration: delay)
    return CCActionSequence(one: d, two: self)
  }
  
  /**
  
  Adds a callback to be executed when the action is done.
  
  ####Example usage:
  
  ```
  //With trailing closure syntax
  let actionWithCallback = CCActionScaleTo(duration: 1.0, scale:10.0).thenDo {
  print("Now I am super big!")
  }
  //Without trailing closure syntax
  let actionWithCallback = CCActionScaleTo(duration: 1.0, scale:10.0).thenDo({
  print("Now I am super big!")
  })
  //Or
  myNode.runAction(myAction.thenDo(myCallBack))
  
  ```
  
  :param: block  The callback closure to be executed when the action is done
  :returns:      A CCActionSequence with the action (self) and an appended CCActionCallBlock
  
  */
  
  public func thenDo(block: CallBackBlock) -> CCActionSequence {
    let c = CCActionCallBlock(block: block)
    return CCActionSequence(one: self, two: c)
  }
  
  /**
  
  Chains a new action to the action (self), effectively creating and returning a CCActionSequence
  
  **Example usage:**
  
  ```
  //Chain two actions together
  myAction.chainedWithAction(anotherAction)
  
  ```
  
  :param: action The action to chain to the existing action (self)
  :returns:      A CCActionSequence with the action (self) and an appended CCAction
  
  */
  
  public func chainedWithAction(action: CCActionFiniteTime) -> CCActionSequence {
    return CCActionSequence(one: self, two: action)
  }
  
  
  /**
  A variable that simply returns `self`. Its only purpose is to add some syntactic sugar to your code. Use only
  if you feel like it, of course.
  
  ####Usage:
  
  ```
  rotate.easedWith(.SineOut).and.delayedWith(0.5)
  
  ```
  */
  
  public var and:CCActionFiniteTime {
    return self
  }
  
  /**
  A variable that simply returns `self`. Its only purpose is to add some syntactic sugar to your code. Use only
  if you feel like it, of course.
  
  ####Usage:
  
  ```
  rotate.and.then.runAction(scaleUp)

  ```
  */
  public var then:CCActionFiniteTime {
    return self
  }
  

   
  
}