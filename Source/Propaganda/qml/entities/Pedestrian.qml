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
  property int converted: 0
  property string party: ""
  property string imageParty: ""

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
    //var dir = new V.Vector2d(velocityX,velocityY)
    //dir = dir.normalize()
  }

  function generateRandomValueBetween(minimum, maximum) {
    return Math.random()*(maximum-minimum) + minimum
  }

  Rectangle {
    id: convertedBar
    height: 3
    width: converted/10
    color: pedestrian.party === "r" ? "red" : "green"
  }

  DebugVisual {
    x: -sprite.width/2
    y: -sprite.height/2
    width: sprite.width
    height: sprite.height
    color: "blue"
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
        ((pedestrian.imageParty === "") ? "p" : (pedestrian.imageParty+"c"))+"1.png",
        ((pedestrian.imageParty === "") ? "p" : (pedestrian.imageParty+"c"))+"2.png",
        ((pedestrian.imageParty === "") ? "p" : (pedestrian.imageParty+"c"))+"3.png"
      ]
      frameRate: pedestrian.frameRate
      loop: true
    }
    Sprite {
      name: "run"
      frameNames: [
        ((pedestrian.imageParty === "") ? "p" : (pedestrian.imageParty+"c"))+"2.png",
        ((pedestrian.imageParty === "") ? "p" : (pedestrian.imageParty+"c"))+"3.png"
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

        if(!convert.running) {
          convert.interval = 16

          if(pedestrian.party !== "" && pedestrian.party !==collidedEntity.entityId) {
            convert.interval = 32
            converted = 0
            convertedBar.visible = true
            pedestrian.imageParty = ""
          }
          convert.start()


          if(collidedEntity.entityId === "r") {
            pedestrian.party = "r"
          } else if(collidedEntity.entityId === "g") {
            pedestrian.party = "g"
          }
        } else {
          audioManager.play("NEVER")
        }
      }
    }

    fixture.onEndContact: {
      var fixture = other;
      var body = fixture.parent;
      var component = body.parent;
      var collidedEntity = component.owningEntity;
      var collidedEntityType = collidedEntity.entityType;
      if(collidedEntityType === "player") {
        convert.stop()
        if(converted < 100) {
          converted = 0
          pedestrian.party = ""
        }


      }
    }
  }

  Timer {
    id: convert
    repeat: true
    interval: 16
    onTriggered: {
      converted++
      if(converted >= 100) {
        convert.stop()
        convertedBar.visible = false
        pedestrian.imageParty = pedestrian.party
        // increase value
        if(pedestrian.party === "r") {
          settingsManager.balance = settingsManager.balance+1
        } else if(pedestrian.party === "g") {
          settingsManager.balance2 = settingsManager.balance2+1
        }
      }
    }
    onRunningChanged: {
      if(running) {

      } else {

      }
    }
  }
  //  Particle {
  //      id: fireParticle

  //      // Particle location properties
  //      x: scene.gameWindowAnchorItem.width/2
  //      y: scene.gameWindowAnchorItem.height+50
  //      rotation: 90

  //      // particle file
  //      fileName: "particles/fire.json"

  //      // start when finished loading
  //      autoStart: true
  //    }
  MovementAnimation {
    id: moveToX
    target: pedestrian
    property: "pos"

    // outputXAxis is +1 if target is to the right, -1 when to the left and 0 when aiming towards it
    velocity: Qt.point(pedestrian.velocityX, pedestrian.velocityY)
  }
}
