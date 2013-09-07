import VPlay 1.0
import QtQuick 1.1

EntityBase {
  id: followerEntity

  property variant realTarget
  property string playerSource: "chicken2-front.png"

  width: sprite.width
  height: sprite.height


  SingleSpriteFromFile {
    id:sprite
    translateToCenterAnchor: false

    filename: "img/Images-hd2.json"
    source: playerSource
  }

  /*MoveToPointHelper {
    id: moveToPointHelper
    // the entity to move towards
    targetObject: realTarget

    // the following all are optional properties for customization:

    // when the distance to the target gets below this value, the targetReached signal is emitted, default is 20
    distanceToTargetThreshold: 20

    // this allows getting the outputYAxis bigger than 0, which is the default
    allowSteerForward: false

    // if this is set and the target is more than 90 away, allow to move backwards, default is false
    //allowSteeringBackwards: false


    // if this is set, the follower would only rotate and not move backwards when the target is more than 90 degrees away, default is false
    stopForwardMovementAtDifferentDirections: false

    onDistanceToTargetChanged: console.debug(distanceToTarget)


  }

  MovementAnimation {
    id: moveToX
         target: followerEntity
         property: "x"

         // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
         velocity: 10*moveToPointHelper.outputXAxis
         // alternatively, also the acceleration could be set, depends on how you want the followerEntity to behave

         // start rotating towards the target immediately
         running: moveToPointHelper.outputXAxis

         // this avoids over-rotating, so rotating further than allowed
         maxPropertyValueDifference: moveToPointHelper.absoluteRotationDifference
       }

  MovementAnimation {

    id: moveToY
         target: followerEntity
         property: "y"

         // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
         velocity: 10*moveToPointHelper.outputYAxis
         // alternatively, also the acceleration could be set, depends on how you want the followerEntity to behave

         // start rotating towards the target immediately
         running: moveToPointHelper.outputYAxis

         // this avoids over-rotating, so rotating further than allowed
         maxPropertyValueDifference: moveToPointHelper.absoluteRotationDifference
       }


*/
  Timer {
    interval: 16
    triggered: {
      realTarget
    }
  }

  BoxCollider {
    width: parent.width
    height: parent.height

    // move forwards and backwards, with a multiplication factor for the desired speed
    force: Qt.point(moveToPointHelper.outputXAxis, moveToPointHelper.outputYAxis)
    onForceChanged: console.debug(-onForceChanged.x,-onForceChanged.y)
    // rotate left and right
    torque: moveToPointHelper.outputXAxis

    DebugVisual {
      color: "red"
    }
  }
}
