//
//  CGPoint+Extensions.swift
//  Cocos2dSwiftUtils
//
//  Created by pontus armini on 2015-06-25.
//  Copyright © 2015 Apportable. All rights reserved.
//


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
    Random CGPoint within a CGRect
    - parameter rectangle: A CGRect which the random CGPoint shall be within
    - returns: A random CGPoint within the supplied CGRect
  */
  public static func randomWithinCGRect(rectangle:CGRect) -> CGPoint {
    let x = CGFloat.random(min: rectangle.minX, max: rectangle.maxX)
    let y = CGFloat.random(min: rectangle.minY, max: rectangle.maxY)
    return CGPoint(x: x, y: y);
  }
  /**
  Random CGPoint within a CGSize
  - parameter size: A CGSize which the random CGPoint shall be within
  - returns: A random CGPoint within the supplied CGSize
  */
  public static func randomWithinCGSize(size:CGSize) -> CGPoint {
    let x = CGFloat.random(min: 0.0, max: size.width)
    let y = CGFloat.random(min: 0.0, max: size.height)
    return CGPointMake(x, y)
  }
  /**
  Random CGPoint within supplied parameters
  - parameter minX, maxX, minY, maxY: (all CGFloat) Parameters for the random CGPoint
  - returns: A random CGPoint within the supplied CGSize
  */
  public static func random(minX minX: CGFloat, maxX: CGFloat, minY: CGFloat, maxY: CGFloat) -> CGPoint {
    precondition(minX < maxX)
    precondition(minY < maxY)
    let rectangle = CGRect(x: minX, y: maxX, width: maxX-minX, height: maxY-minY)
    return CGPoint.randomWithinCGRect(rectangle)
  }
  /**
  Random CGPoint within a circle, defined by radius and center point
  - parameter radius,centerPoint:
  - returns: A random CGPoint within the circle defined by the supplied radius and center point.
  */
  public static func randomWithinCirlceWithRadius(radius:CGFloat, andCenterPoint centerPoint:CGPoint) -> CGPoint {
    let r = CGFloat.random(min: 0.0, max: radius)
    let a = CGFloat.random(min: 0.0, max: (π * 2.0))
    let x = centerPoint.x + r * cos(a)
    let y = centerPoint.y + r * sin(a)
    return CGPointMake(x,y)
  }

}

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

/**
* Performs a linear interpolation between two CGPoint values.
*/
public func lerp(start start: CGPoint, end: CGPoint, t: CGFloat) -> CGPoint {
  return start + (end - start) * t
}