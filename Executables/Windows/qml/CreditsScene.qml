import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: scene


  LevelBackground {
    id: levelBackground
    anchors.centerIn: scene.gameWindowAnchorItem
    source: "img/about_screen-hd2.png"
  }

  function backPressed() {
    sceneLoader.activateMainMenuScene()
  }


//  Image {
//    source: "img/vplay.png"
//    anchors.horizontalCenter: optionsScene.horizontalCenter
//    anchors.bottom: optionsScene.bottom
//    anchors.bottomMargin: 160
//    // the image size is bigger (for hd2 image), so only a single image no multiresimage can be used
//    // this scene is not performance sensitive anyway!
//    fillMode: Image.PreserveAspectFit
//    height: 55

//    MouseArea {
//      anchors.fill: parent
//      onClicked: nativeUtils.openUrl("http://v-play.net");
//    }
//  }

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
