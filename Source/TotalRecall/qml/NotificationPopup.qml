import VPlay 1.0
import QtQuick 1.1

SceneBase {
  id: notificationPopup

  property string notificationMessage: "No Message atm..."

  GUIWindow {
    id: mainMenu

    anchors.centerIn: parent

    width: parent.width/2
    height: parent.height/2

    Text {
      id: notificationMessageText
      anchors.centerIn: parent
      text: notificationMessage
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
