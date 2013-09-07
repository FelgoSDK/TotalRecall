import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: optionsScene


  function backPressed() {
    sceneLoader.activateMainMenuScene()
  }

  GUIWindow {
    id: mainMenu

    anchors.centerIn: parent

    width: parent.width/3*2
    height: parent.height/3*2

    Column {
      anchors.centerIn: parent


      Button {
        id: soundButton

        text: settingsManager.sound ? qsTr("Sound On")+translation.language : qsTr("Sound Off")+translation.language

        onClicked: {
          audioManager.play("BUTTON")
          settingsManager.sound = !settingsManager.sound
        }
      }

      Button {
        id: musicButton

        text: settingsManager.music ? qsTr("Music On")+translation.language : qsTr("Music Off")+translation.language

        onClicked: {
          audioManager.play("BUTTON")
          settingsManager.music = !settingsManager.music
        }
      }

      Button {
        id: vibrateButton

        text: settingsManager.vibrate ? qsTr("Vibrate On")+translation.language : qsTr("Vibrate Off")+translation.language

        onClicked: {
          audioManager.play("BUTTON")
          settingsManager.vibrate = !settingsManager.vibrate
        }
      }
    }
  }
}
