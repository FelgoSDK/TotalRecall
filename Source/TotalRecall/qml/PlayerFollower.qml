import VPlay 1.0
import QtQuick 1.1

EntityBase {
  id: followerEntity

  property variant realTarget
  property string playerSource: "chicken2-front.png"

  property bool followerEntity: false

  SingleSpriteFromFile {
    id:sprite
    translateToCenterAnchor: false

    filename: "img/Images-hd2.json"
    source: playerSource
  }

  function moveNow() {
    followerEntity = true
  }

  MoveToPointHelper {
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


//        onOutputXAxisChanged: console.debug("xAxis output:", outputXAxis)
//        onOutputYAxisChanged: console.debug("yAxis output:", outputYAxis)
//        onDistanceToTargetChanged: console.debug("target dist:", distanceToTarget)

    onTargetReached: {
      // make it stop faster
      followerEntity.targetReached = true
      collider.linearVelocity = Qt.point(0, 0)
    }

    onDistanceToTargetChanged: {
      if(absoluteRotationDifference <= 20)
      {
        //collider.force = Qt.point(0, 0)


      }
    }

    onAbsoluteRotationDifferenceChanged: {
      if(absoluteRotationDifference < 5)
      {

        // make it stop faster
        collider.angularVelocity = 0
      }
    }
  }

  BoxCollider {
    id: collider
    width: parent.width
    height: parent.height

    //sensor: true

    active: true
    bodyType: Body.Dynamic

    // also possible would be to set the velocity instead of the force, but not such a smooth movement
    //velocity: 300*moveToPointHelper.outputXAxis

    // move forwards and backwards, with a multiplication factor for the desired speed
    //force: realTarget.targetReached ? Qt.point(0, 0) : Qt.point(moveToPointHelper.outputYAxis*4, moveToPointHelper.outputXAxis*4)
    linearVelocity: realTarget.targetReached ? Qt.point(0, 0) : Qt.point(moveToPointHelper.outputYAxis*100, moveToPointHelper.outputXAxis*100)
    // rotate left and right
    //torque:  moveToPointHelper.outputXAxis*0.1
    //angularVelocity: 30
    sleepingAllowed: true
    fixedRotation: true

    // NOTE: you MUST set a density if you want to apply a torque!
    density: 0.5
    friction: 0.9
    linearDamping: 0.9

    DebugVisual {
      color: "red"
    }
  }
}
