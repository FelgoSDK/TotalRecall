import QtQuick 1.1
import VPlay 1.0

//Loader {
Item {
  id: sceneLoader

  property variant currentScene //: gameScene//mainMenuScene
  property variant nextScene: splashScene

  SplashScreenScene {
    id:splashScene
  }

  IntroScene {
    id:introScene
  }
  MainMenuScene {
    id:mainMenuScene
  }
  CreditsScene {
    id:creditsScene
  }
  OptionsScene {
    id:optionScene
  }
  GameScene {
    id:gameScene
  }
  GameOverScene {
    id:gameOverScene
  }
  /*property string splashScene: "SplashScreenScene.qml"
  property string introScene: "IntroScene.qml"
  property string mainMenuScene: "MainMenuScene.qml"
  property string creditsScene: "CreditsScene.qml"
  property string optionScene: "OptionsScene.qml"
  property string gameScene: "GameScene.qml"
  property string gameOverScene: "GameOverScene.qml"*/

  property variant source: currentScene ? currentScene : splashScene
  property variant item
  onSourceChanged: {
    item = source

    if(item) {
      activeScene = item

      // forward container allways to container of scene
      entityManager.entityContainer = item.entityContainerOfScene
      item.open()
    }

    //loadItemWithCocos(sceneLoader)
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

  function activateGameOverScene() {
    nextScene = gameOverScene
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

