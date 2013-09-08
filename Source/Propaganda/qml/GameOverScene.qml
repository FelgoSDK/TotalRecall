import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: optionsScene


  LevelBackground {
      id: levelBackground
      anchors.centerIn: optionsScene.gameWindowAnchorItem
      source: "img/about_screen-hd2.png"
  }

  function backPressed() {
    sceneLoader.activateMainMenuScene()
  }


  Column {
    anchors.centerIn: parent
    Text {
      text: "Red Army Follower "+settingsManager.balance
      color: "white"
    }
    Text {
      text: "Green Army Follower "+settingsManager.balance2
      color: "white"
    }
  }


}
