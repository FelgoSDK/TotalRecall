import VPlay 1.0
import QtQuick 1.1

Item {
  id: level

  SpriteBatchContainer {
    id: spriteBatchContainer
  }

//  Player {
//    x: 130
//    y: 200
//  }
  PlayerDragger {
    id: playerDragger
    width: 50
    height: 50
    x: 130
    y: 200
  }

  PlayerFollower {
    id: character
    realTarget: playerDragger
    x: 130
    y: 100
  }
}
