import VPlay 1.0
import QtQuick 1.1
import ".."

EntityBase {
  id: pedestrian
  entityType: "pedestrian"

  property string pedSource: "chicken2-front.png"
  property int velocityX: generateRandomValueBetween(-10, 10)
  property int velocityY: generateRandomValueBetween(-10, 10)

  Component.onCompleted: {
    moveToX.start()
//    moveToY.start()
  }

  onPosChanged: {
//      if(pos.x <= (sprite.width / 2) || pos.x >= (level.))
  }

  function generateRandomValueBetween(minimum, maximum) {
      return Math.random()*(maximum-minimum) + minimum
  }

  SingleSpriteFromFile {
    id:sprite
    translateToCenterAnchor: true

    filename: "../img/images-hd2.json"
    source: pedSource
  }

  CircleCollider {
    id: collider
    radius: sprite.width /2
    sensor: true
  }
  DebugVisual {
    x: -sprite.width/2
    y: -sprite.height/2
    width: sprite.width
    height: sprite.height
    color: "blue"
  }

  MovementAnimation {
    id: moveToX
    target: pedestrian
    property: "pos"

    // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
    velocity: Qt.point(pedestrian.velocityX, pedestrian.velocityY)
    // alternatively, also the acceleration could be set, depends on how you want the followerEntity to behave

//    // start rotating towards the target immediately
//    running: moveToPointHelper.outputXAxis

//    // this avoids over-rotating, so rotating further than allowed
//    maxPropertyValueDifference: moveToPointHelper.absoluteRotationDifference
  }

//  MovementAnimation {
//    id: moveToY
//    target: pedestrian
//    property: "y"

//    // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
//    velocity: pedestrian.velocityY
//    // alternatively, also the acceleration could be set, depends on how you want the followerEntity to behave

////    // start rotating towards the target immediately
////    running: moveToPointHelper.outputXAxis

////    // this avoids over-rotating, so rotating further than allowed
////    maxPropertyValueDifference: moveToPointHelper.absoluteRotationDifference
//  }
}
