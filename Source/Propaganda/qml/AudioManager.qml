import VPlay 1.0
import QtQuick 1.1

Item {
  id: audioManager

  property string idBUTTON: "BUTTON"
  property string idURAD: "URA_D"
  property string idURAG: "URA_G"
  property string idDRUG: "DRUG"
  property string idNEVER: "NEVER"
  function play(clipID) {
    if(!settingsManager.sound)
      return

      switch(clipID) {
        case idBUTTON:
          clip.source = "audio/button.wav"
          break
        case idURAD:
          clip.source = "audio/ura_d.wav"
          break
        case idURAG:
          clip.source = "audio/ura_g.wav"
          break
        case idDRUG:
          clip.source = "audio/drug.wav"
          break
        case idNEVER:
          clip.source = "audio/never.wav"
          break
      }

      if(settingsManager.vibrate) {
        nativeUtils.vibrate()
      }

    clip.play()
  }

  function playMusic(title) {
    if(!settingsManager.music)
      return

    if(title) {
      music.source = "audio/title_music.mp3"
      music.volume = 1
    }
    else {
      music.source = "audio/crowd.mp3"
      music.volume = 0.2
    }

    music.play()
  }

  function stopMusic() {
    music.stop()
  }

  BackgroundMusic {
    id: music
  }

  Sound {
    id: clip
    volume: 1
  }
}
