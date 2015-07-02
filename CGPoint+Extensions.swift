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


import CoreGraphics

public extension CGPoint {
  /**
  * Creates a new CGPoint given a CGVector.
  */
  public init(vector: CGVector) {
    self.init(x: vector.dx, y: vector.dy)
  }
  
  /**
  * Given an angle in radians, creates a vector of length 1.0 and returns the
  * result as a new CGPoint. An angle of 0 is assumed to point to the right.
  */
  public init(angle: CGFloat) {
    self.init(x: cos(angle), y: sin(angle))
  }
  
  /**
  * Adds (dx, dy) to the point.
  */
  public mutating func offset(dx dx: CGFloat, dy: CGFloat) -> CGPoint {
    x += dx
    y += dy
    return self
  }
  
  /**
  * Returns the length (magnitude) of the vector described by the CGPoint.
  */
  public func length() -> CGFloat {
    return sqrt(x*x + y*y)
  }
  
  /**
  * Returns the squared length of the vector described by the CGPoint.
  */
  public func lengthSquared() -> CGFloat {
    return x*x + y*y
  }
  
  /**
  * Normalizes the vector described by the CGPoint to length 1.0 and returns
  * the result as a new CGPoint.
  */
  func normalized() -> CGPoint {
    let len = length()
    return len>0 ? self / len : CGPoint.zeroPoint
  }
  
  /**
  * Normalizes the vector described by the CGPoint to length 1.0.
  */
  public mutating func normalize() -> CGPoint {
    self = normalized()
    return self
  }
  
  /**
  * Calculates the distance between two CGPoints. Pythagoras!
  */
  public func distanceTo(point: CGPoint) -> CGFloat {
    return (self - point).length()
  }
  
  /**
  * Returns the angle in radians of the vector described by the CGPoint.
  * The range of the angle is -π to π; an angle of 0 points to the right.
  */
  public var angle: CGFloat {
    return atan2(y, x)
  }
  /**
  * Returns the angle in degrees of the vector described by the CGPoint.
  * The range of the angle is -180 to 180; an angle of 0 points to the right.
  */
  public var angleInDegrees: CGFloat {
    return self.angle * (180.0/π)
  }
  /**
  * Returns the angle in degrees of the vector described by the CGPoint.
  * The range of the angle is -180 to 180; an angle of 0 points to the right.
  */
  public func angleBetweenSelfAndPoint(point:CGPoint) -> Float {
    var vector = point - self
    return -Float(vector.normalize().angleInDegrees)
  }
  // MARK: - Random functions
  /**
  A random CGPoint holding a coordinate within the supplied parameters
  
  :param: minX Minimum x value
  :param: maxX Maximum x value
  :param: minY Minimum y value
  :param: maxY Maximum y value
  
  :returns: A random CGPoint within the supplied parameters.
  */
  public static func random(minX minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> CGPoint {
    precondition(minX < maxX)
    precondition(minY < maxY)
    let rectangle = CGRect(x: minX, y: maxX, width: maxX-minX, height: maxY-minY)
    return CGPoint.randomWithinCGRect(rectangle)
  }
  /**
    A random CGPoint coordinate within a supplied CGRect
  
    :param: rectangle A CGRect which the random CGPoint shall be within
    :returns: A random CGPoint within the supplied CGRect
  */
  public static func randomWithinCGRect(rectangle:CGRect) -> CGPoint {
    let x = CGFloat.random(min: rectangle.minX, max: rectangle.maxX)
    let y = CGFloat.random(min: rectangle.minY, max: rectangle.maxY)
    return CGPoint(x: x, y: y);
  }
  /**
  Mutate a CGPoint to a random point within a CGRect
  
  :param: rectangle A CGRect which the random CGPoint shall be within
  :returns: A random CGPoint within the supplied CGRect
  */
  public mutating func randomWithinCGRect(rectangle:CGRect) -> CGPoint {
    let nx = CGFloat.random(min: rectangle.minX, max: rectangle.maxX)
    let ny = CGFloat.random(min: rectangle.minY, max: rectangle.maxY)
    x = nx
    y = ny
    return self
  }
  /**
  Random CGPoint within a CGSize
  
  :param: size A CGSize which the random CGPoint shall be within
  :returns: A random CGPoint within the supplied CGSize
  */
  public static func randomWithinCGSize(size:CGSize) -> CGPoint {
    let x = CGFloat.random(min: 0.0, max: size.width)
    let y = CGFloat.random(min: 0.0, max: size.height)
    return CGPointMake(x, y)
  }
  /**
  Mutate a CGPoint to a random point within a CGSize
  
  :param: size A CGSize which the random CGPoint shall be within
  :returns: A random CGPoint within the supplied CGSize
  */
  public mutating func randomWithinCGSize(size:CGSize) -> CGPoint {
    let nx = CGFloat.random(min: 0.0, max: size.width)
    let ny = CGFloat.random(min: 0.0, max: size.height)
    self = CGPoint(x: nx, y: ny)
    return self
  }
  /**
  Random CGPoint within a circle, defined by a radius and a center point
  
  :param: radius The radius of the wanted circle
  :param: centerPoint The center of the wanted circle.
  :returns: A random CGPoint within the circle defined by the supplied radius and center point.
  */
  public static func randomWithinCircleWithRadius(radius:CGFloat, andCenterPoint centerPoint:CGPoint) -> CGPoint {
    let r = CGFloat.random(min: 0.0, max: radius)
    let a = CGFloat.random(min: 0.0, max: (π * 2.0))
    let x = centerPoint.x + r * cos(a)
    let y = centerPoint.y + r * sin(a)
    return CGPointMake(x,y)
  }
  /**
  Mutate a CGPoint to a random point within a circle, defined by a radius and a center point
  
  :param: radius The radius of the wanted circle
  :param: centerPoint The center of the wanted circle.
  :returns: A random CGPoint within the circle defined by the supplied radius and center point.
  */
  public mutating func randomWithinCircleWithRadius(radius:CGFloat, andCenterPoint centerPoint:CGPoint) -> CGPoint {
    let r = CGFloat.random(min: 0.0, max: radius)
    let a = CGFloat.random(min: 0.0, max: (π * 2.0))
    let x = centerPoint.x + r * cos(a)
    let y = centerPoint.y + r * sin(a)
    self = CGPointMake(x,y)
    return self
  }

}

/**
 Performs a linear interpolation between two CGPoint values.
  :param: start Starting CGPoint
  :param: end   Ending CGPoint
  :t: Time
*/
public func lerp(start start: CGPoint, end: CGPoint, t: CGFloat) -> CGPoint {
  return start + (end - start) * t
}
