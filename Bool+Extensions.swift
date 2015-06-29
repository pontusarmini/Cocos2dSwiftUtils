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


public extension Bool {
  /**
  Random Bool
  - returns: A random Bool, true or false.
  */
  public static func random() -> Bool {
    return (arc4random_uniform(2) == 0) ? true : false
  }
  /**
  Random Bool with probability
  - parameter probability: A CGFloat between 0.0-1.0. Lower value = less probability of the function returning true
  - returns: A random Bool
  */
  public static func randomWithProbability(probability: CGFloat) -> Bool {
    precondition(probability >= 0 && probability < 1.0)
    return CGFloat.random() <= probability
  }
}