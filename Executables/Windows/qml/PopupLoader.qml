import QtQuick 1.1
import VPlay 1.0

Loader {
  id: popupLoader

  property string currentItem: ""

  property string notificationPopup: "NotificationPopup.qml"
  property string ingameMenuPopup: "IngameMenu.qml"
  property variant payload1

  source: currentItem

  onSourceChanged: {
    loadItemWithCocos(popupLoader)
    //console.debug("[PopupLoader] Change Popup to ", utils.cropPath(source, true))
  }

  onLoaded: {
    if(item) {
      item.open()
      if(currentItem == notificationPopup) {
        item.notificationMessage = popupLoader.payload1
      }
    }
  }

  function activateNotification(text) {
    popupLoader.payload1 = text
    audioManager.play("BUTTON")
    currentItem = notificationPopup
  }

  function activateIngameMenu() {
    audioManager.play("BUTTON")
    currentItem = ingameMenuPopup
  }

  function closePopup() {
    audioManager.play("BUTTON")
    currentItem = ""
  }
}

