import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: optionsScene


  LevelBackground {
      id: levelBackground
      anchors.centerIn: optionsScene.gameWindowAnchorItem
      source: "img/about_screen-hd2.png"
  }

  function backPressed() {
    sceneLoader.activateMainMenuScene()
  }


      Image {
        source: "img/vplay.png"
        anchors.horizontalCenter: optionsScene.horizontalCenter
        anchors.bottom: optionsScene.bottom
        anchors.bottomMargin: 160
        // the image size is bigger (for hd2 image), so only a single image no multiresimage can be used
        // this scene is not performance sensitive anyway!
        fillMode: Image.PreserveAspectFit
        height: 55

        MouseArea {
          anchors.fill: parent
          onClicked: nativeUtils.openUrl("http://v-play.net");
        }
      }


}
