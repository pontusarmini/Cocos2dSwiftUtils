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
public extension CCActionInterval {
  
  /**
  Wraps the action in a CCActionEase-subclass defined by the [EasingType](../Enums/EasingType.html) enum argument.

  **Example usage:**

  ```
  //Creates a scaling up action with a bouncing easing function
  let easedScaleUp = CCActionScaleBy(duration: 1.0, scale: 3.0).easedWith(.BounceOut)
  ```

  :param: easing  An EasingType enum member (example: .SineIn, .SineOut)
  :returns:       The action wrapped inside an CCActionEase-subclass
  */
  
  public func easedWith(easing: EasingType) -> CCActionEase {
     assert(isNotSequence, "Applying easing on a sequence might give unexpected results. If you are using .delayedWith before .easedWith, try swapping their positions")
    return easing.easedAction(self, periodRate: nil)
  }
  
  /**
  
  Wraps the action in a CCActionEase-subclass defined by the [EasingType](Enums.html) enum argument.
  
  **Example usage:**
  
  ```
  //Creates a move action eased with CCActionEaseIn with a rate of 3.0
  let easedMove = CCActionMoveTo(duration: 5.0, position: pos).easedWith(.EaseIn, periodOrRate: 3.0)
  ```
  
  :param: easing  An EasingType enum member (example: .SineIn, .SineOut)
  :param: r       An optional period or rate to use when applicable.
  :returns:       The action wrapped inside an CCActionEase-subclass
  
  */
  
  public func easedWith(easing: EasingType, periodOrRate r: Float?) -> CCActionEase {
    assert(isNotSequence, "Applying easing on a sequence might give unexpected results. If you are using .delayedWith before .easedWith, try swapping their positions")
    return easing.easedAction(self, periodRate: r)
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
  
  public func chainedWithAction(action: CCActionInterval) -> CCActionInterval {
    let s = CCActionSequence(one: self, two: action)
    return s
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
  
  public func thenDo(block: CallBackBlock) -> CCActionInterval {
    let c = CCActionCallBlock(block: block)
    let s = CCActionSequence(one: self, two: c)
    return s
  }
  
  public func delayedWith(delay: CCTime) -> CCActionInterval {
    let d = CCActionDelay(duration: delay)
    let s = CCActionSequence(one: self, two: d)
    return s
  }
  public var and:CCActionInterval {
    return self
  }
  
  /**
  Checks if the action (self) is a CCActionSequence
  */
  private var isNotSequence: Bool {
    if let _ = self as? CCActionSequence {
      return false
    } else {
      return true
    }
  }
  
}



