import VPlay 1.0
import QtQuick 1.1
import ".."
import "../scripts/Vector2d.js" as V

EntityBase {
  id: pedestrian
  entityType: "pedestrian"

  //property string pedSource: "chicken2-front.png"

  property int frameRate: 7
  property int velocityX: generateRandomValueBetween(-10, 10)
  property int convertedRed: 0
  property int convertedBlue: 0

  onVelocityXChanged: {
    if(velocityX == 0 ) {
      velocityX = generateRandomValueBetween(-10, 10)
    }
    pedestrian.frameRate = Math.abs(velocityX)
  }

  property int velocityY: generateRandomValueBetween(-10, 10)
  onVelocityYChanged: {
    if(velocityY == 0 ) {
      velocityY = generateRandomValueBetween(-10, 10)
    }
    pedestrian.frameRate = Math.abs(velocityY)
  }

  Component.onCompleted: {
    moveToX.start()
  }

  onXChanged: {
    if(x <= (sprite.width / 2) || pos.x >= (320 - (sprite.width / 2))) {
      velocityX = -velocityX
      velocityY = -velocityY
    }
    updateDir()
  }

  onYChanged: {
    if(pos.y <= (sprite.height / 2) || pos.y >= (480 - (sprite.height / 2))) {
      velocityX = -velocityX
      velocityY = -velocityY
    }
    updateDir()
  }

  function updateDir() {
    var dir = new V.Vector2d(velocityX,velocityY)
    dir = dir.normalize()
  }

  function generateRandomValueBetween(minimum, maximum) {
    return Math.random()*(maximum-minimum) + minimum
  }

  Rectangle {
    id: convertedBar
    height: 3
    width: convertedRed/10
    color: "red"
  }

  SpriteSequenceFromFile {
    id: sprite
    translateToCenterAnchor: true

    //property int spriteBatchNodeZ: 8

    filename: "../img/images-hd2.json"
    running: true

    Sprite {
      name: "idle"
      frameNames: [
        "p1.png",
        "p2.png",
        "p3.png"
      ]
      frameRate: pedestrian.frameRate
      loop: true
    }
    Sprite {
      name: "run"
      frameNames: [
        "p2.png",
        "p3.png"
      ]
      frameRate: pedestrian.frameRate
      loop: true
    }
  }

  CircleCollider {
    id: collider
    radius: sprite.width /2

    collisionTestingOnlyMode: true
    sensor: true
    categories: settingsManager.pedestrianGroup

    fixedRotation: true

    fixture.onBeginContact: {
      var fixture = other;
      var body = fixture.parent;
      var component = body.parent;
      var collidedEntity = component.owningEntity;
      var collidedEntityType = collidedEntity.entityType;
      if(collidedEntityType === "player") {
        convertRed.start()
      }
    }

    fixture.onEndContact: {
      var fixture = other;
      var body = fixture.parent;
      var component = body.parent;
      var collidedEntity = component.owningEntity;
      var collidedEntityType = collidedEntity.entityType;
      if(collidedEntityType === "player") {
        convertRed.stop()
        if(convertedRed <= 100) {
          convertedRed = 0
        }
      }
    }
  }

  Timer {
    id: convertRed
    repeat: true
    interval: 16
    onTriggered: {
      convertedRed++
      if(convertedRed == 100) {
        convertRed.stop()
      }
    }
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
  }

  MovementAnimation {
    id: rotationMovement
    target: followerEntity
    property: "rotation"

    // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
    velocity: 300*direction
    // alternatively, also the acceleration could be set, depends on how you want the followerEntity to behave


    // this avoids over-rotating, so rotating further than allowed
    maxPropertyValueDifference: moveToPointHelper.absoluteRotationDifference
  }
}
