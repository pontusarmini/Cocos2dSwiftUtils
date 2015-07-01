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


public extension CCNode {
  
  /**
  Run a block of code after specified delay
  - parameter delay: The time to pass before running the block. 
  - parameter runBlock: The block of code to run.
  */
  public func afterDelay(delay: CCTime, runBlock: CallBackBlock) {
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
  Run an array of actions in a sequence
  - parameter actions: An array of CCActions
  - parameter block: A block of code to run when the sequence is finished running
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime], thenRun block: CallBackBlock) {
    var a = actions
    let c = CCActionCallBlock(block: block)
    a.append(c)
    let sequence = CCActionSequence(array: a)
    runAction(sequence)
  }
  
  /**
  Run an array of actions in a sequence and repeat n number of times
  - parameter actions: An array of CCActions
  - parameter times: The number of times to repeat the sequence
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime], andRepeatTimes times: Int) {
    let sequence = CCActionSequence(array: actions)
    let repeatAction = CCActionRepeat(action: sequence, times: UInt(times))
    runAction(repeatAction)
  }
  /**
  Run an array of actions in a sequence and repeat n number of times, then run a block of code
  - parameter actions: An array of CCActions
  - parameter times: The number of times to repeat the sequence
  - parameter block: A block of code to run when the repeated sequence is finished running
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime], andRepeatTimes times: Int, thenRun block:CallBackBlock) {
    var a = actions
    let c = CCActionCallBlock(block: block)
    a.append(c)
    let sequence = CCActionSequence(array: a)
    let repeatAction = CCActionRepeat(action: sequence, times: UInt(times))
    runAction(repeatAction)
  }
  /**
  Run an array of actions in a sequence and repeat forever
  - parameter actions: An array of CCActions
  */
  public func runSequenceOfActionsAndRepeatForever(actions: [CCActionFiniteTime]) {
    let sequence = CCActionSequence(array: actions)
    let repeatAction = CCActionRepeatForever(action: sequence)
    runAction(repeatAction)
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
  Run an array of actions simultaneously, then run a block of code
  - parameter actions: An array of CCActions
  - parameter block: A block of code to run when all of the actions has finished running
  */
  public func runParallelActions(actions: [CCActionFiniteTime], thenRun block: CallBackBlock) {
    let spawn = CCActionSpawn(array: actions)
    let c = CCActionCallBlock(block: block)
    let a = [spawn, c]
    runSequenceOfActions(a)
  }
  /**
  Run an action and then a callback block
  - parameter action: The action to run
  - parameter block: The callback to run after the action as finished running
  */
  public func runAction(action:CCActionInterval, thenRun block: CallBackBlock) {
    let c = CCActionCallBlock(block: block)
    let s = CCActionSequence(one: action, two: c)
    runAction(s)
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
  /**
  Run an action and repeat it a number of times
  - parameter action: The action to run (must be a CCActionFiniteTime subclass)
  - parameter times: The number of times to repeat the action
  */
  public func runAction(action:CCActionFiniteTime, andRepeatTimes times: Int) {
    let repeatAction = CCActionRepeat(action: action, times: UInt(times))
    runAction(repeatAction)
  }
  /**
  Run an action and repeat it a number of times, then run a block of code
  - parameter action: The action to run (must be a CCActionFiniteTime subclass)
  - parameter times: The number of times to repeat the action
  */
  public func runAction(action:CCActionFiniteTime, andRepeatTimes times: Int, thenRun block: CallBackBlock) {
    let repeatAction = CCActionRepeat(action: action, times: UInt(times))
    let call = CCActionCallBlock(block: block)
    let actions = [repeatAction, call]
    runSequenceOfActions(actions)
  }
  /**
  Run an action and repeat it forever
  - parameter action: The action to run (must be a CCActionInterval subclass)
  */
  public func runActionAndRepeatForever(action:CCActionInterval) {
    let repeatAction = CCActionRepeatForever(action: action)
    runAction(repeatAction)
  }
  
}

