import VPlay 1.0
import QtQuick 1.1

Item {
  id: level

  SpriteBatchContainer {
    id: spriteBatchContainer
  }

  Player {
    x: 130
    y: 200
  }
}
