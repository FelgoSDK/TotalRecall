import VPlay 1.0
import QtQuick 1.1
import "scripts/levelLogic.js" as LevelLogic
SceneBase {
  id: scene

  LevelBackground {
    id: levelBackground

    anchors.centerIn: scene.gameWindowAnchorItem
    source: "img/bg_ingame-hd2.png"
  }

  // allows collision detection with pyhsics colliders (BoxColliders, CircleColliders and PolygonColliders)
  // it supports 2 modes:
  //  - for collision testing (set collisionTestingOnlyMode to true) when the positions get updated manually, e.g. by animations
  //  - for physics driven games like AngryBirds or this sample game
  PhysicsWorld {
    id: physicsWorld
    // this puts it on top of all other items for the physics debug renderer
    z: 1

    // for physics-based games, this should be set to 60!
    updatesPerSecondForPhysics: 60

    // this should be increased so it looks good, by default it is set to 1 to save performance
    // when it is left at 1, the ball sometimes "float" into the wall or paddles
    velocityIterations: 5
    positionIterations: 5
    debugDrawVisible: true
  }

  entityContainerOfScene: level

  Level {
    id: level
    width: parent.width
    height: parent.height
  }

  Button  {
    anchors.right: scene.gameWindowAnchorItem.right
    anchors.top: scene.gameWindowAnchorItem.top
    text: qsTr("Menu")+translation.language
    onClicked: {
      popupLoader.activateIngameMenu()
    }
  }

  function open() {
    opacity = 1

    LevelLogic.init()
    level.reset()
    audioManager.playMusic()
  }

  function close() {
    opacity = 0
    entityManager.removeAllEntities()
    audioManager.stopMusic()
  }

  function backPressed() {
    sceneLoader.activateMainMenuScene()
  }
}
