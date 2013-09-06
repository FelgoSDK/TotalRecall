import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: ingameMenu

  GUIWindow {
    id: mainMenu

    anchors.centerIn: parent

    width: parent.width/2
    height: parent.height/4*3

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
