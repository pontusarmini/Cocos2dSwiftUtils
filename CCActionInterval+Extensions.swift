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

public extension CCActionInterval {
  
  public func easedWith(easing: EasingType) -> CCActionEase {
    assert(isNotSequence, "Applying easing on a sequence might give unexpected results")
    return easing.easedAction(self, periodRate: nil)
  }
  public func easedWith(easing: EasingType, andPeriodOrRate r: Float?) -> CCActionEase {
    assert(isNotSequence, "Applying easing on a sequence might give unexpected results")
    return easing.easedAction(self, periodRate: r)
  }
  
  public func thenDo(block: CallBackBlock) -> CCActionInterval {
    let c = CCActionCallBlock(block: block)
    let s = CCActionSequence(one: self, two: c)
    return s
  }
  public func chainedWithAction(action: CCActionInterval) -> CCActionInterval {
    let s = CCActionSequence(one: self, two: action)
    return s
  }
  private var isNotSequence: Bool {
    if let _ = self as? CCActionSequence {
      return false
    } else {
      return true
    }
  }
  
}

