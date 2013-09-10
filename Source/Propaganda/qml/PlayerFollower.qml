import VPlay 1.0
import QtQuick 1.1
import "scripts/Vector2d.js" as V
EntityBase {
  id: followerEntity


  preventFromRemovalFromEntityManager: true

  entityType: "player"
  entityId: "r"

  property variant realTarget

  property bool moveit: false

  property real frameRate: 7

  SpriteSequenceFromFile {
    id: sprite
    translateToCenterAnchor: true

    //property int spriteBatchNodeZ: 8

    filename: "img/images-hd2.json"
    running: true

    Sprite {
      name: "idle"
      frameNames: [
        entityId+"1.png",
        entityId+"1.png",
        entityId+"1.png"
      ]
      frameRate: followerEntity.frameRate

      loop: true
    }
    Sprite {
      name: "run"
      frameNames: [
        entityId+"1.png",
        entityId+"2.png",
        entityId+"1.png",
        entityId+"3.png",
      ]
      frameRate: followerEntity.frameRate
      loop: true
    }
  }

  property bool runstarted: false

  onRunstartedChanged: {
    if(runstarted) {
      sprite.jumpTo("run")
      rotationMovement.running = true
    }
  }

  function moveNow() {
    runstarted = true

    if(!finishTimer.running)
      finishTimer.start()
  }

  function releasedNow() {
    if(!finishTimer.running)
      finishTimer.start()
  }

  function calPos() {
    var posFinger = new V.Vector2d(realTarget.x,realTarget.y)
    var posPlayer = new V.Vector2d(followerEntity.x,followerEntity.y)
    var dir = posFinger.subtract(posPlayer)
    dir = dir.normalize()
    followerEntity.frameRate*=dir
    var velocity = 2.7
    dir = dir.multiply(velocity)
    followerEntity.x += dir.x
    followerEntity.y +=dir.y
    if(!finishTimer.running)
      return

    if(Math.abs(followerEntity.x-posFinger.x) < 2 && Math.abs(followerEntity.y - posFinger.y) < 2) {
      finishTimer.stop()
      sprite.jumpTo("idle")
      rotationMovement.running = false
      runstarted = false
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

  MoveToPointHelper {
    id: moveToPointHelper
    // the entity to move towards
    targetObject: realTarget

    // the following all are optional properties for customization:

    // when the distance to the target gets below this value, the targetReached signal is emitted, default is 20
    distanceToTargetThreshold: 80

    // this allows getting the outputYAxis bigger than 0, which is the default
    allowSteerForward: false

    // if this is set and the target is more than 90 away, allow to move backwards, default is false
    //allowSteerBackward: false


    // if this is set, the follower would only rotate and not move backwards when the target is more than 90 degrees away, default is false
    stopForwardMovementAtDifferentDirections: false
  }

  MovementAnimation {
    id: rotationMovement
    target: followerEntity
    property: "rotation"

    // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
    velocity: 300*moveToPointHelper.outputXAxis
    // alternatively, also the acceleration could be set, depends on how you want the followerEntity to behave


    // this avoids over-rotating, so rotating further than allowed
    maxPropertyValueDifference: moveToPointHelper.absoluteRotationDifference
  }


  CircleCollider {
    id: collider
    radius: sprite.width/2
    width: sprite.width
    height: sprite.height

    collisionTestingOnlyMode: true
    sensor: true
    categories: settingsManager.playerColliderGroup

    fixedRotation: true

    fixture.onBeginContact: {
      var fixture = other;
      var body = fixture.parent;
      var component = body.parent;
      var collidedEntity = component.owningEntity;
      var collidedEntityType = collidedEntity.entityType;
      if(collidedEntityType === "pedestrian") {
        //audioManager.play("NEVER")
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
}
