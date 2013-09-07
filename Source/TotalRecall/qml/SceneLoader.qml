import QtQuick 1.1
import VPlay 1.0

Loader {
  id: sceneLoader

  property string currentScene //: gameScene//mainMenuScene
  property string nextScene: splashScene

  property string splashScene: "SplashScreenScene.qml"
  property string introScene: "IntroScene.qml"
  property string mainMenuScene: "MainMenuScene.qml"
  property string creditsScene: "CreditsScene.qml"
  property string optionScene: "OptionsScene.qml"
  property string gameScene: "GameScene.qml"

  source: currentScene ? currentScene : splashScene

  onSourceChanged: {
    if(item) {
      activeScene = item

      // forward container allways to container of scene
      entityManager.entityContainer = item.entityContainerOfScene
      item.open()
    }

    loadItemWithCocos(sceneLoader)
    //console.debug("[SceneLoader] Change Scene to ", utils.cropPath(source, true))
  }

  function activateIntroScene() {
    nextScene = introScene
    closeScene()
  }

  function activateMainMenuScene() {
    nextScene = mainMenuScene
    closeScene()
  }

  function activateCreditsScene() {
    nextScene = creditsScene
    closeScene()
  }

  function activateOptionsScene() {
    nextScene = optionScene
    closeScene()
  }

  function activateGameScene() {
    nextScene = gameScene
    closeScene()
  }

  Timer {
    id: fadeOutTimer
    repeat: false
    interval: 350
    onTriggered: {
      currentScene = nextScene
    }
  }

  function closeScene() {
    if(item) {
      item.close()
    }
    fadeOutTimer.start()
  }
}

