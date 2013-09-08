import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: optionsScene


  MultiResolutionImage {
    id: redWins
    anchors.centerIn: optionsScene.gameWindowAnchorItem
    source: "img/end_of_game_red-hd2.png"
  }

  MultiResolutionImage {
    id: greenWins
    anchors.centerIn: optionsScene.gameWindowAnchorItem
    source: "img/end_of_game_green-hd2.png"
  }

  MultiResolutionImage {
    id: drawWins
    anchors.centerIn: optionsScene.gameWindowAnchorItem
    source: "img/end_of_game_draw-hd2.png"
  }

  function backPressed() {
    audioManager.playMusic(true)
    audioManager.play("BUTTON")
    sceneLoader.activateMainMenuScene()
  }

  function open() {
    drawWins.visible = false
    redWins.visible = false
    greenWins.visible = false

    fanfare.play()
    opacity = 1
    if(settingsManager.balance === settingsManager.balance2) {
      drawWins.visible = true
    } else {
      if(settingsManager.balance > settingsManager.balance2) {
        redWins.visible = true
      } else {
        greenWins.visible = true
      }
    }
  }

  MouseArea {
    anchors.fill: parent
    onClicked: {
      fanfare.stop()
      audioManager.playMusic(true)
      audioManager.play("BUTTON")
      sceneLoader.activateMainMenuScene()
    }
  }

  BackgroundMusic {
    id: fanfare
    source: "audio/end_music.mp3"
    autoPlay: false
  }

}
