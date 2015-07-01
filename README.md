# Cocos2D Swift Utils #

![Cocos2d Swift Utils Icon](http://pontusarmini.com/content/images/2015/06/icon2.png)

A collection of Cocos2d-Spritebuilder/ObjC helper classes and functions. Swift only.

This repo is partially inspired by (and borrows some code from) the Sprite Kit equivalent over at [Ray Wenderlich's] (https://github.com/raywenderlich/SKTUtils).

This repo is currently under construction.

Example usage (more to come soon):

```swift

//Setup a CCAction with applied easing (CCActionEaseElasitcOut in this case) and a callback
let scaleUp = CCActionScaleBy(duration: 1.0, scale: 3.0).easedWith(.ElasticOut).thenRun {
    print("Scale up is done!")
}

//Run an action repeated times (with optional callback)
myNode.runAction(scaleUp, andRepeatTimes: 4){ 
  print("Done scaling up 4 times!")
}

//Run a sequence of actions 
let actions = [action1, action2, action3, action4]
myNode.runSequenceOfActions(actions)

```

