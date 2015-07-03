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
  This function can be used to repeat an action forever
  
  :returns: A CCActionRepeatForever object
  */
  public var repeatForever:CCActionRepeatForever {
    return CCActionRepeatForever(action: self)
  }
  
  /**
  A variable that simply returns `self`. Its only purpose is to add some syntactic sugar to your code. Use only
  if you feel like it, of course.
  
  ####Usage:
  
  ```
  let rotate = CCActionRotateBy(duration: 0.5, angle: 180)
  button.runAction(rotate.easedWith(.SineOut).and.delayedWith(0.5))
  
  ```
  */
  
  override public var and:CCActionInterval {
    return self
  }
  
  /**
  A variable that simply returns `self`. Its only purpose is to add some syntactic sugar to your code. Use only
  if you feel like it, of course.
  
  ####Usage:
  
  ```
  let rotate = CCActionRotateBy(duration: 0.5, angle: 180)
  let scaleUp = CCActionScaleTo(duration: 0.5, scale: 2.0)
  let rotateAndScaleUp = rotate.and.then.runAction(scaleUp)
  button.runAction(rotateAndScaleUp)
  
  ```
  */
  override public var then:CCActionInterval {
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



