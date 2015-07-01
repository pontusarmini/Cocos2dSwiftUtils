# Cocos2D Swift Utils #

![Cocos2d Swift Utils Icon](http://pontusarmini.com/content/images/2015/06/icon2.png)

A collection of Cocos2d-Spritebuilder/ObjC helper classes and functions. Swift only.

This repo is partially inspired by (and borrows some code from) the Sprite Kit equivalent over at [Ray Wenderlich's] (https://github.com/raywenderlich/SKTUtils).

This repo is currently under construction.

Example usage (more to come soon):

###Running Actions###

```swift

//Setup a CCAction with applied easing (CCActionEaseElasticOut in this case) and a callback
let scaleUp = CCActionScaleBy(duration: 1.0, scale: 3.0).easedWith(.ElasticOut).thenDo {
    print("Scale up is done!")
}
//Chain actions
myNode.runAction(action1.chainedWith(action2).thenDo {
  print("Done running chained actions")
})

//Run an action repeated times (with optional callback)
myNode.runAction(scaleUp, andRepeatTimes: 4){ 
  print("Done scaling up 4 times!")
}

//Run a sequence of actions 
let actions = [action1, action2, action3, action4]
myNode.runSequenceOfActions(actions)

//Run a sequence of actions and a callback when done
myNode.runSequenceOfActions(actions) {
  print("Sequence is done running!")
}

//Run a sequence to be repeated forever
myNode.runSequenceOfActionsAndRepeatForever(actions)

//Run actions simultaneously
myNode.runParallelActions(actions)

//Run actions simultaneously with a callback when done
myNode.runParallelActions(actions) {
  print("All actions are done")
}

```

