import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: scene

  LevelBackground {
    id: levelBackground
    x: scene.gameWindowAnchorItem.x
    y: scene.gameWindowAnchorItem.y
  }

  Level {
    id: level
    width: parent.width
    height: parent.height
  }

  Particle {
    scale: 0.5
    x: 10
    y: 10
    // start when finished loading
    autoStart: true
    fileName: "particles/FireBall.json"
  }

  Button  {
    anchors.right: scene.gameWindowAnchorItem.right
    anchors.top: scene.gameWindowAnchorItem.top
    text: qsTr("Menu")+translation.language
    onClicked: {
      popupLoader.activateIngameMenu()
    }
  }

  function backPressed() {
    sceneLoader.activateMainMenuScene()
  }
}
