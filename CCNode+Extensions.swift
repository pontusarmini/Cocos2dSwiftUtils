//
//  CCNode+Extensions.swift
//  Cocos2dSwiftUtils
//
//  Created by pontus armini on 2015-06-25.
//  Copyright © 2015 Pontus Armini. All rights reserved.
//
public typealias CCUtilBlock = Void -> ()

public extension CCNode {
  
  /**
  Run a block of code after specified delay
  - parameter delay, runBlock: The time to pass before running the block. The block of code to run.
  */
  public func afterDelay(delay: CCTime, runBlock: CCUtilBlock) {
    let delayAction = CCActionDelay(duration: delay)
    let runBlock = CCActionCallBlock(block: runBlock)
    self.runAction(CCActionSequence(array: [delayAction,runBlock]))
  }
  
  
}
