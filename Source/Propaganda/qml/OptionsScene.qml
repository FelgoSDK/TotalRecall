import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: scene


  LevelBackground {
    id: levelBackground
    anchors.centerIn: scene.gameWindowAnchorItem
    source: "img/options_screen-hd2.png"
  }

  function backPressed() {
    sceneLoader.activateMainMenuScene()
  }

  Column {
    anchors.centerIn: parent

    ImageButton {
      id: sound
      onClicked: {
        audioManager.play("BUTTON")
        settingsManager.sound = !settingsManager.sound
        music.sound = settingsManager.sound ? "img/sound_on-hd2.png" : "img/sound_off-hd2.png"
      }
      width: 250
      height: 36
      text: ""
      normal: settingsManager.sound ? "img/sound_on-hd2.png" : "img/sound_off-hd2.png"
      highlight: ""
    }
    ImageButton {
      id: music
      onClicked: {
        audioManager.play("BUTTON")
        settingsManager.music = !settingsManager.music
        music.normal = settingsManager.music ? "img/music_on-hd2.png" : "img/music_off-hd2.png"
      }
      width: 250
      height: 36
      text: ""
      normal: settingsManager.music ? "img/music_on-hd2.png" : "img/music_off-hd2.png"
      highlight: ""
    }
    ImageButton {
      id: sleep
      onClicked: {
        audioManager.play("BUTTON")
        settingsManager.goToSleep = !settingsManager.goToSleep
        sleep.normal = settingsManager.goToSleep ? "img/sleep_on-hd2.png" : "img/sleep_off-hd2.png"
      }
      width: 250
      height: 36
      text: ""
      normal: settingsManager.goToSleep ? "img/sleep_on-hd2.png" : "img/sleep_off-hd2.png"
      highlight: ""
    }
    ImageButton {
      id: vibrate
      onClicked: {
        audioManager.play("BUTTON")
        settingsManager.vibrate = !settingsManager.vibrate
        vibrate.normal = settingsManager.vibrate ? "img/vibration_on-hd2.png" : "img/vibration_off-hd2.png"
      }
      width: 250
      height: 36
      text: ""
      normal: settingsManager.vibrate ? "img/vibration_on-hd2.png" : "img/vibration_off-hd2.png"
      highlight: ""
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
