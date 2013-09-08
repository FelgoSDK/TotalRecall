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

  ImageButton {
    id: play
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 10
    onClicked: {
      audioManager.play("BUTTON")
      sceneLoader.activateMainMenuScene()
    }
    text: ""
    normal: "img/back-hd2.png"
    highlight: "img/back_pressed-hd2.png"
  }

}
