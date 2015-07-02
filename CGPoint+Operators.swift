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



// MARK: - CGPoint operators
/**
* Adds two CGPoint values and returns the result as a new CGPoint.
*/
public func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

/**
* Increments a CGPoint with the value of another.
*/
public func += (inout left: CGPoint, right: CGPoint) {
  left = left + right
}

/**
* Adds a CGVector to this CGPoint and returns the result as a new CGPoint.
*/
public func + (left: CGPoint, right: CGVector) -> CGPoint {
  return CGPoint(x: left.x + right.dx, y: left.y + right.dy)
}

/**
* Increments a CGPoint with the value of a CGVector.
*/
public func += (inout left: CGPoint, right: CGVector) {
  left = left + right
}

/**
* Subtracts two CGPoint values and returns the result as a new CGPoint.
*/
public func - (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

/**
* Decrements a CGPoint with the value of another.
*/
public func -= (inout left: CGPoint, right: CGPoint) {
  left = left - right
}

/**
* Subtracts a CGVector from a CGPoint and returns the result as a new CGPoint.
*/
public func - (left: CGPoint, right: CGVector) -> CGPoint {
  return CGPoint(x: left.x - right.dx, y: left.y - right.dy)
}

/**
* Decrements a CGPoint with the value of a CGVector.
*/
public func -= (inout left: CGPoint, right: CGVector) {
  left = left - right
}

/**
* Multiplies two CGPoint values and returns the result as a new CGPoint.
*/
public func * (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x * right.x, y: left.y * right.y)
}

/**
* Multiplies a CGPoint with another.
*/
public func *= (inout left: CGPoint, right: CGPoint) {
  left = left * right
}

/**
* Multiplies the x and y fields of a CGPoint with the same scalar value and
* returns the result as a new CGPoint.
*/
public func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

/**
* Multiplies the x and y fields of a CGPoint with the same scalar value.
*/
public func *= (inout point: CGPoint, scalar: CGFloat) {
  point = point * scalar
}

/**
* Multiplies a CGPoint with a CGVector and returns the result as a new CGPoint.
*/
public func * (left: CGPoint, right: CGVector) -> CGPoint {
  return CGPoint(x: left.x * right.dx, y: left.y * right.dy)
}

/**
* Multiplies a CGPoint with a CGVector.
*/
public func *= (inout left: CGPoint, right: CGVector) {
  left = left * right
}

/**
* Divides two CGPoint values and returns the result as a new CGPoint.
*/
public func / (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x / right.x, y: left.y / right.y)
}

/**
* Divides a CGPoint by another.
*/
public func /= (inout left: CGPoint, right: CGPoint) {
  left = left / right
}

/**
* Divides the x and y fields of a CGPoint by the same scalar value and returns
* the result as a new CGPoint.
*/
public func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

/**
* Divides the x and y fields of a CGPoint by the same scalar value.
*/
public func /= (inout point: CGPoint, scalar: CGFloat) {
  point = point / scalar
}

/**
* Divides a CGPoint by a CGVector and returns the result as a new CGPoint.
*/
public func / (left: CGPoint, right: CGVector) -> CGPoint {
  return CGPoint(x: left.x / right.dx, y: left.y / right.dy)
}

/**
* Divides a CGPoint by a CGVector.
*/
public func /= (inout left: CGPoint, right: CGVector) {
  left = left / right
}

public typealias PointTuple = (x:CGFloat, y:CGFloat)

/**
Subtracts a CGPoint by a custom tuple (x:CGFloat, y:CGFloat), meant to make it quicker to type.

:param: left A CGPoint
:param: right A custom tuple (x:CGFloat, y:CGFloat)
:returns: A subtracted CGPoint
*/
public func - (left:CGPoint, right: PointTuple) -> CGPoint {
  return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
/**
Adds the values of custom tuple (x:CGFloat, y:CGFloat) toa CGPoint, meant to make it quicker to type.

:param: left A CGPoint
:param: right A custom tuple (x:CGFloat, y:CGFloat)
:returns: An new CGPoint with added values
*/
public func + (left:CGPoint, right: PointTuple) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
/**
Subtracts a CGPoint by a custom tuple (x:CGFloat, y:CGFloat), meant to make it quicker to type.

:param: left A CGPoint
:param: right A custom tuple (x:CGFloat, y:CGFloat)
:returns: A subtracted CGPoint
*/
public func -= (inout left:CGPoint, right: PointTuple) {
  left = left - right
}
/**
Adds the values of custom tuple (x:CGFloat, y:CGFloat) to a CGPoint, meant to make it quicker to type.

**Example usage:**

```
var position = CGPoint(x:10, y:10)
position += (x:10, y:10) //Position now = CGPoint(x:20, y:20)
```

:param: left A CGPoint
:param: right A custom tuple (x:CGFloat, y:CGFloat)
:returns: An new CGPoint with added values
*/
public func += (inout left:CGPoint, right: PointTuple) {
  left = left + right
}
