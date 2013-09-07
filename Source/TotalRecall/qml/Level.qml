import VPlay 1.0
import QtQuick 1.1

Item {
  id: level

  SpriteBatchContainer {
    id: spriteBatchContainer
  }

  Player {
    x: level.width/2-width/2
    y: 10+height/2
  }

  Player {
    x: level.width/2-width/2
    y: level.height-10-height/2
  }
}
