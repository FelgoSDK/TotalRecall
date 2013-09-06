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
      id: leftColumn
      anchors.verticalCenter: parent.verticalCenter
      x: 5
      y: 50
      spacing: 15

      MenuText {
        text: qsTr("V-Play Team:\nDavid Berger\nNico Harather")+translation.language
      }

      MenuText {
        text: qsTr("Team :\nPeter \nPeter")+translation.language
      }
    }


    Column {
      id: logoColumn
      //anchors.top: b1.top
      //anchors.topMargin: -8
      anchors.left: leftColumn.right
      anchors.leftMargin: 30
      anchors.verticalCenter: parent.verticalCenter
      spacing: 8

      MenuText {
        text: qsTr("Proudly developed with")+translation.language
      }

      Image {
        source: "img/vplay.png"
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
  }
}
