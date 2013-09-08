import QtQuick 1.1
import VPlay 1.0

SceneBase {
  id: scene

  LevelBackground {
      id: levelBackground
      anchors.centerIn: scene.gameWindowAnchorItem
      source: "img/title-hd2.png"
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

  Row {
    x: 30//anchors.horizontalCenter: parent.horizontalCenter
    y: 440

    ImageButton {
      id: play
      onClicked: {
        audioManager.play("BUTTON")
        sceneLoader.activateGameScene()
      }
      text: ""
      normal: "img/play-hd2.png"
      highlight: "img/play_pressed-hd2.png"
    }
    ImageButton {
      id: about
      onClicked: {
        audioManager.play("BUTTON")
        sceneLoader.activateCreditsScene()
      }
      text: ""
      normal: "img/about-hd2.png"
      highlight: "img/about_pressed-hd2.png"
    }
//      ImageButton {
//        id: about
//        text: qsTr("Options")+translation.language
//        onClicked: {
//          audioManager.play("BUTTON")
//          sceneLoader.activateOptionsScene()
//        }
//        normal: "img/play.png"
//        highlight: "img/play_pressed.png"
//      }
    ImageButton {
      id: quit
      onClicked: {
        audioManager.play("BUTTON")
        sceneLoader.activateOptionsScene()
      }
      text: ""
      normal: "img/options-hd2.png"
      highlight: "img/options_pressed-hd2.png"
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

  function open() {
    opacity = 1
    //audioManager.playMusic(true)
  }

  function close() {
    opacity = 0
    //audioManager.stopMusic()
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
