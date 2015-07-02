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

/**
A collection of extended functions to the Bool type allowing to easily get random boolean values.
*/

public extension Bool {
/**
This function returns a random boolean, with 50/50 probability of returning true or false

**Usage:**
  
  `let randomBool = Bool.random()`

:returns: A random boolean value, true or false

*/
  public static func random() -> Bool {
    return (arc4random_uniform(2) == 0) ? true : false
  }
/**
This function returns a random boolean value with a custom probability of returning true or false

**Usage:**
  
  ```
  //A bool with ≈30% probability of being true
  let random = Bool.randomWithProbability(0.3)
  
  ```

:param: probability  The probability percentage expressed in a double value between 0.0-1.0
:returns:             A random boolean value
*/
  public static func randomWithProbability(probability: Double) -> Bool {
    precondition(probability >= 0 && probability < 1.0)
    return CGFloat.random() <= CGFloat(probability)
  }
/**
This function lets you mutate an existing boolean variable to a random boolean value

**Usage:**

  ```
    var myBool = true
    //Now with a 50-50% probability of being true or false:
    myBool.random()
  ```
*/
  public mutating func random() {
    self = Bool.random()
  }
  /**
  This function lets you mutate an existing boolean variable to a random boolean value with a probability parameter
  
  **Usage:**
  
  ```
    var myBool = true
    //Now with only a ≈30% probability of being true:
    myBool.randomWithProbability(0.3)
  ```
  
  :param: probability  The probability percentage expressed in a double value between 0.0-1.0

  */
  public mutating func randomWithProbability(probability: Double) {
    precondition(probability >= 0 && probability < 1.0)
    self = CGFloat.random() <= CGFloat(probability)
  }

}