import QtQuick 1.1
import VPlay 1.0

SceneBase {
  id: scene

  GUIWindow {
    id: mainMenu

    anchors.centerIn: parent

    width: parent.width/3*2
    height: parent.height/3*2

    Column {
      anchors.centerIn: parent

      Button {
        text: qsTr("Play")+translation.language
        onClicked: {
          audioManager.play("BUTTON")
          sceneLoader.activateGameScene()
        }
      }
      Button {
        text: qsTr("Credits")+translation.language
        onClicked: {
          audioManager.play("BUTTON")
          sceneLoader.activateCreditsScene()
        }
      }
      Button {
        text: qsTr("Options")+translation.language
        onClicked: {
          audioManager.play("BUTTON")
          sceneLoader.activateOptionsScene()
        }
      }
      Button {
        text: qsTr("Notification!")+translation.language
        onClicked: {
          audioManager.play("BUTTON")
          popupLoader.activateNotification("Test this notification!")
        }
      }
    }
  }

  Connections {
    // nativeUtils should only be connected, when this is the active scene
    target: activeScene === scene ? nativeUtils : null
    onMessageBoxFinished: {
      if(accepted)
        Qt.quit()
    }
  }

  onBackPressed: {
    audioManager.play("BUTTON")
    nativeUtils.displayMessageBox(qsTr("Really quit the game?")+translation.language, "", 2);
  }

  // this allows navigation through key presses
  Keys.onReturnPressed: {
    audioManager.play("BUTTON")
    sceneLoader.activateGameScene()
  }
}
