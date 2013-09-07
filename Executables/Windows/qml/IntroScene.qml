import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: scene

  Video {
    id: video
    anchors.fill: scene.gameWindowAnchorItem
    autoPlay: true
    source: "videos/intro.mp4"

    onEnded: {
      sceneLoader.activateMainMenuScene()
    }
  }

  MouseArea {
    anchors.fill: parent
    onPressAndHold: {
      video.visible = false
      sceneLoader.activateMainMenuScene()
    }
  }
}
