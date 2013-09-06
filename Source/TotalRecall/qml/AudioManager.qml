import VPlay 1.0
import QtQuick 1.1

Item {
  id: audioManager

  property string idBUTTON: "BUTTON"
  function play(clipID) {
    if(!settingsManager.sound)
      return

    if(clipID === idBUTTON) {
      clip.source = "audio/button.wav"
    }
    clip.play()
  }


  Sound {
    id: clip
  }
}
