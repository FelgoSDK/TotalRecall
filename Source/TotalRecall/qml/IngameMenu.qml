import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: ingameMenu

  GUIWindow {
    id: mainMenu

    anchors.centerIn: parent

    width: parent.width/2
    height: parent.height/4*3

    Column {
      anchors.centerIn: parent

      Button {
        text: qsTr("Resume")+translation.language
        onClicked: {
          audioManager.play("BUTTON")
          popupLoader.closePopup()
        }
      }
      Button {
        text: qsTr("Main Menu")+translation.language
        onClicked: {
          audioManager.play("BUTTON")
          popupLoader.closePopup()
          sceneLoader.activateMainMenuScene()
        }
      }
      Button {
        text: qsTr("Debug Visuals Visible ")+translation.language + settingsManager.debugVisualsEnabled
        onClicked: {
          audioManager.play("BUTTON")
          settingsManager.debugVisualsEnabled = !settingsManager.debugVisualsEnabled
        }
      }
    }

    Button {
      anchors.horizontalCenter: parent.horizontalCenter
      anchors.bottom: parent.bottom

      text: qsTr("OK")+translation.language
      onClicked: {
        popupLoader.closePopup()
      }
    }
  }
}
