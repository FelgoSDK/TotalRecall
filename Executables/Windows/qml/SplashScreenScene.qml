import QtQuick 1.1
import VPlay 1.0

SceneBase {
  id: scene


  Item {
    anchors.centerIn: scene.gameWindowAnchorItem
    opacity: 0.0

    LevelBackground {
      id: levelBackground
      anchors.centerIn: parent
      source: "img/splash_screen-hd2.png"
    }
    /*Text {
      id: seText
      anchors.centerIn: parent
      text: qsTr("Propaganda")+translation.language
      color: "white"
      font.pointSize: 20
    }

    Text {
      anchors.top: seText.bottom
      anchors.horizontalCenter: seText.horizontalCenter
      text: qsTr("-- Total Recall AEC --")+translation.language
      color: "white"
    }*/
    NumberAnimation on opacity {
      id: fadeInAnimation
      running: false
      duration: 500
      to: 1.0
    }
//    NumberAnimation on opacity {
//      id: fadeOutAnimation
//      running: false
//      duration: 500
//      to: 0.0
//    }
  }

  Timer {
    id: changeToNextSceneTimer
    interval: 3000
    onTriggered: {
      sceneLoader.activateMainMenuScene()
    }
  }

  Timer {
    id: fadeOutTimer
    interval: 1500
    onTriggered: {
      //fadeOutAnimation.start()
    }
  }

  Component.onCompleted: {
    audioManager.playMusic(true)
    fadeInAnimation.start()
    //fadeOutTimer.start()
    changeToNextSceneTimer.start()
  }

  MouseArea {
    anchors.fill: parent
    onPressAndHold: {
      changeToNextSceneTimer.stop()
      //fadeOutTimer.stop()
      sceneLoader.activateMainMenuScene()
    }
  }
}
