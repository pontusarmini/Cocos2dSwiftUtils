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
///Does this work then?
///
///
///I'm not sure
public extension CCNode {
  
  /**
  Run a block of code after specified delay
  
  :param: delay The time to pass before running the block. 
  :param: runBlock The block of code to run.
  */
  public func afterDelay(delay: CCTime, runBlock: CallBackBlock) {
    let delayAction = CCActionDelay(duration: delay)
    let runBlock = CCActionCallBlock(block: runBlock)
    runAction(CCActionSequence(array: [delayAction,runBlock]))
  }
  /**
  Run an array of actions in a sequence
  
  :param: actions An array of CCActions
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime]) {
    let sequence = CCActionSequence(array: actions)
    runAction(sequence)
  }
  /**
  Run an array of actions in a sequence
  
  :param: actions An array of CCActions
  :param: block A block of code to run when the sequence is finished running
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime], thenDo block: CallBackBlock) {
    var a = actions
    let c = CCActionCallBlock(block: block)
    a.append(c)
    let sequence = CCActionSequence(array: a)
    runAction(sequence)
  }
  
  /**
  Run an array of actions in a sequence and repeat n number of times
  
  :param: actions An array of CCActions
  :param: times The number of times to repeat the sequence
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime], andRepeatTimes times: Int) {
    let sequence = CCActionSequence(array: actions)
    let repeatAction = CCActionRepeat(action: sequence, times: UInt(times))
    runAction(repeatAction)
  }
  /**
  Run an array of actions in a sequence and repeat n number of times, then run a block of code
  
  :param: actions An array of CCActions
  :param: times The number of times to repeat the sequence
  :param: block A block of code to run when the repeated sequence is finished running
  */
  public func runSequenceOfActions(actions: [CCActionFiniteTime], andRepeatTimes times: Int, thenDo block:CallBackBlock) {
    var a = actions
    let c = CCActionCallBlock(block: block)
    a.append(c)
    let sequence = CCActionSequence(array: a)
    let repeatAction = CCActionRepeat(action: sequence, times: UInt(times))
    runAction(repeatAction)
  }
  /**
  Run an array of actions in a sequence and repeat forever
  
  :param: actions An array of CCActions
  */
  public func runSequenceOfActionsAndRepeatForever(actions: [CCActionFiniteTime]) {
    let sequence = CCActionSequence(array: actions)
    let repeatAction = CCActionRepeatForever(action: sequence)
    runAction(repeatAction)
  }
  /**
  Run an array of actions simultaneously
  
  :param: actions An array of CCActions
  */
  public func runParallelActions(actions: [CCActionFiniteTime]) {
    let spawn = CCActionSpawn(array: actions)
    runAction(spawn)
  }
  /**
  Run an array of actions simultaneously, then run a block of code
  
  :param: actions An array of CCActions
  :param: block A block of code to run when all of the actions has finished running
  */
  public func runParallelActions(actions: [CCActionFiniteTime], thenDo block: CallBackBlock) {
    let spawn = CCActionSpawn(array: actions)
    let c = CCActionCallBlock(block: block)
    let a = [spawn, c]
    runSequenceOfActions(a)
  }
  /**
  Run an array of actions simultaneously and repeat n number of times
  
  :param: actions An array of CCActions
  :param: times The number of times to repeat the actions
  */
  public func runParallelActions(actions: [CCActionFiniteTime], andRepeatTimes times: Int) {
    let spawn = CCActionSpawn(array: actions)
    let repeatAction = CCActionRepeat(action: spawn, times: UInt(times))
    runAction(repeatAction)
  }
  
  /**
  Run an array of actions simultaneously and repeat n number of times, then run callback
  
  :param: actions An array of CCActions
  :param: times The number of times to repeat the actions
  :param: block The callback to run when the actions are done 
  */
  public func runParallelActions(actions: [CCActionFiniteTime], andRepeatTimes times: Int, thenDo block: CallBackBlock) {
    let spawn = CCActionSpawn(array: actions)
    let repeatAction = CCActionRepeat(action: spawn, times: UInt(times))
    let c = CCActionCallBlock(block: block)
    let a = [repeatAction, c]
    runSequenceOfActions(a)
  }
  
  /**
  Run an array of actions simultaneously and repeat forever
  
  :param: actions An array of CCActions
  :param: times The number of times to repeat the actions
  :param: block The callback to run when the actions are done
  */
  public func runParallelActionsAndRepeatForever(actions: [CCActionFiniteTime]) {
    let spawn = CCActionSpawn(array: actions)
    let repeatAction = CCActionRepeatForever(action: spawn)

    runAction(repeatAction)
  }

  
  /**
  Run an action and then a callback block
  
  :param: action The action to run
  :param: block The callback to run after the action as finished running
  */
  public func runAction(action:CCActionInterval, thenDo block: CallBackBlock) {
    let c = CCActionCallBlock(block: block)
    let s = CCActionSequence(one: action, two: c)
    runAction(s)
  }
  /**
  Run an action with easing — a CCActionEase subclass.
  
  ####Repeating
  If you want to repeat an eased action, use the [CCActionInterval](../Extensions/CCActionInterval.html) extension `easedWith(_:)` or `easedWith(_:periodOrRate:)` in combination with for example `runAction(_:andRepatTimes:)`
  
  **Example usage:**
  
  ```
    let blinkEased = CCActionBlink(duration: 1.0, blinks: 4).easedWith(.SineOut)
    runAction(blinkEased, andRepeatTimes: 10)
  
  ```
  

  
  :param: action The action to run (must be a CCActionInterval subclass)
  :param: easing The easing type (defined by the custom EasingType enum that matches the different easing subclasses, example usage: .BounceIn).
  :param: periodOrRate An optional period or rate float value. This argument is only applicable on easing types for which you can specify either a rate or period. Pass nil if not needed.
  */
  public func runAction(action:CCActionInterval, withEasing easing: EasingType, andPeriodOrRate r: Float?) {
    runAction(easing.easedAction(action, periodRate: r))
  }
  /**
  Run an action with easing (CCActionEase). If you need to specify a rate or period, use `runAction(_:withEasing:andPeriodOrRate:)`
  
  ####Repeating
  If you want to repeat an eased action, use the [CCActionInterval](../Extensions/CCActionInterval.html) extension `easedWith(_:)` or `easedWith(_:periodOrRate:)` in combination with for example `runAction(_:andRepatTimes:)`
  
  **Example usage:**
  
  ```
    let easedMove = CCActionMoveTo(duration: 5.0, position: pos).easedWith(.EaseIn, periodOrRate: 3.0)
    runAction(easedMove, andRepeatTimes: 10)
  ```
  
  :param: action The action to run (must be a CCActionInterval subclass)
  :param: easing The easing type (defined by the custom EasingType enum that matches the different easing subclasses, example usage: .BounceIn).
  */
  public func runAction(action:CCActionInterval, withEasing easing: EasingType) {
    runAction(easing.easedAction(action, periodRate: nil))
  }
  /**
  Run an action and repeat it a number of times
  
  :param: action The action to run (must be a CCActionFiniteTime subclass)
  :param: times The number of times to repeat the action
  */
  public func runAction(action:CCActionFiniteTime, andRepeatTimes times: Int) {
    let repeatAction = CCActionRepeat(action: action, times: UInt(times))
    runAction(repeatAction)
  }
  /**
  Run an action and repeat it a number of times, then run a block of code
  
  :param: action The action to run (must be a CCActionFiniteTime subclass)
  :param: times The number of times to repeat the action
  */
  public func runAction(action:CCActionFiniteTime, andRepeatTimes times: Int, thenDo block: CallBackBlock) {
    let repeatAction = CCActionRepeat(action: action, times: UInt(times))
    let call = CCActionCallBlock(block: block)
    let actions = [repeatAction, call]
    runSequenceOfActions(actions)
  }
  /**
  Run an action and repeat it forever
  
  :param: action The action to run (must be a CCActionInterval subclass)
  */
  public func runActionAndRepeatForever(action:CCActionInterval) {
    let repeatAction = CCActionRepeatForever(action: action)
    runAction(repeatAction)
  }
  
}

