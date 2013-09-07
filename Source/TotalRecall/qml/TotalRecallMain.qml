import QtQuick 1.1
import VPlay 1.0

GameWindow {
  id: window

  width: 320*2
  height: 480*2

  minimizeable: true
  maximizeable: true
  resizeable: true

  // forward events always to the controller of the loaded scene
  Keys.forwardTo: sceneLoader.item.controllerOfScene

  // sceneLoader and Managers should be available in every scene.
  property alias audioManager: audioManager
  property alias settingsManager: settingsManager
  property alias sceneLoader: sceneLoader
  property alias popupLoader: popupLoader

  // Custom font loading of ttf fonts
  /*FontLoader {
    id: fontHUD
    source: "fonts/munro.ttf"
  }*/

  AudioManager {
    id: audioManager
  }

  SettingsManager {
    id: settingsManager
  }

  // all content is loaded dynamically by the sceneLoader element.
  SceneLoader {
    id: sceneLoader
  }

  // all content is loaded dynamically by the PopupLoader element.
  PopupLoader {
    id: popupLoader
  }

  EntityManager {
    id: entityManager
    // forward container allways to container of scene
    entityContainer: sceneLoader.item.entityContainerOfScene

    dynamicCreationEntityList: sceneLoader.item.dynamicCreationEntityList
  }
}
