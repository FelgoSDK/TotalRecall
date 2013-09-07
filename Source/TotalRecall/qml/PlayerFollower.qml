import VPlay 1.0
import QtQuick 1.1
import "scripts/Vector2d.js" as V
EntityBase {
  id: followerEntity

  entityType: "player"

  property variant realTarget
  property string playerSource: "chicken2-front.png"

  property bool moveit: false

  SingleSpriteFromFile {
    id:sprite
    translateToCenterAnchor: true

    filename: "img/Images-hd2.json"
    source: playerSource
  }

  function moveNow() {
    //followerEntity.moveit = false
    calPos()
  }

  function releasedNow() {
     finishTimer.start()
  }

  function calPos() {
    var posFinger = new V.Vector2d(realTarget.x,realTarget.y)
    var posPlayer = new V.Vector2d(followerEntity.x,followerEntity.y)
    var dir = posFinger.subtract(posPlayer)
    dir = dir.normalize()
    var velocity = 0.2
    dir = dir.multiply(velocity)
    followerEntity.x += dir.x
    followerEntity.y +=dir.y
    if(!finishTimer.running)
      return

    if(Math.abs(followerEntity.x-posFinger.x) < 5 && Math.abs(followerEntity.y - posFinger.y) < 5) {
      finishTimer.stop()
    }
  }

  Timer {
    id: finishTimer
    repeat: true
    interval: 16
    onTriggered: {
      calPos()
    }
  }

  /*MoveToPointHelper {
    id: moveToPointHelper
    // the entity to move towards
    targetObject: realTarget

    // the following all are optional properties for customization:

    // when the distance to the target gets below this value, the targetReached signal is emitted, default is 20
    distanceToTargetThreshold: 0

    // this allows getting the outputYAxis bigger than 0, which is the default
    allowSteerForward: true

    // if this is set and the target is more than distanceToTargetThreshold:  away, allow to move backwards (i.e. outputYAxis getting smaller 0), default is true
    allowSteerBackward: true


    // if this is set, the follower would only rotate and not move backwards when the target is more than 90 degrees away, default is false
    stopForwardMovementAtDifferentDirections: false

    onTargetReached: {
      // make it stop faster
      followerEntity.moveit = true
      //collider.linearVelocity = Qt.point(0, 0)
    }

    onDistanceToTargetChanged: {
      if(distanceToTarget < 10) {
        followerEntity.moveit = true
        collider.linearVelocity = Qt.point(0, 0)
      }
    }
  }
*/
  BoxCollider {
    id: collider
    width: sprite.width
    height: sprite.height
    x: sprite.x
    y: sprite.y

    collisionTestingOnlyMode: true

    //bodyType: Body.Dynamic

    // move forwards and backwards, with a multiplication factor for the desired speed
    //force: followerEntity.moveit ? Qt.point(0, 0) : Qt.point(moveToPointHelper.outputYAxis*4, moveToPointHelper.outputXAxis*4)
    //linearVelocity: followerEntity.moveit ? Qt.point(0, 0) : Qt.point(moveToPointHelper.outputYAxis*100, moveToPointHelper.outputXAxis*100)
    // rotate left and right
    //torque:  moveToPointHelper.outputXAxis*0.1
    //angularVelocity: 30
    //sleepingAllowed: true
    fixedRotation: true

    // NOTE: you MUST set a density if you want to apply a torque!
    density: 0.5
    friction: 0.9
    linearDamping: 0.9
  }
  DebugVisual {
    x: -sprite.width/2
    y: -sprite.height/2
    width: sprite.width
    height: sprite.height
    color: "blue"
  }
}
