import QtQuick 1.1
import VPlay 1.0

SceneBase {
  id: scene


  Item {
    anchors.centerIn: parent
    opacity: 0.0

    Text {
      id: seText
      anchors.centerIn: parent
      text: qsTr("Pray and Play")+translation.language
      color: "white"
      font.pointSize: 20
    }

    Text {
      anchors.top: seText.bottom
      anchors.horizontalCenter: seText.horizontalCenter
      text: qsTr("-- Total Recall --")+translation.language
      color: "white"
    }
    NumberAnimation on opacity {
      id: fadeInAnimation
      running: false
      duration: 2000
      to: 1.0
    }
    NumberAnimation on opacity {
      id: fadeOutAnimation
      running: false
      duration: 2000
      to: 0.0
    }
  }

  Timer {
    id: changeToNextSceneTimer
    interval: 5000
    onTriggered: {
      sceneLoader.activateIntroScene()
    }
  }

  Timer {
    id: fadeOutTimer
    interval: 3000
    onTriggered: {
      fadeOutAnimation.start()
    }
  }

  Component.onCompleted: {
    fadeInAnimation.start()
    fadeOutTimer.start()
    changeToNextSceneTimer.start()
  }

  MouseArea {
    anchors.fill: parent
    onPressAndHold: {
      changeToNextSceneTimer.stop()
      fadeOutTimer.stop()
      sceneLoader.activateIntroScene()
    }
  }
}
