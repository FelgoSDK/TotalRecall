    import VPlay 1.0
import QtQuick 1.1
import "entities"

Item {
  id: level

  SpriteBatchContainer {
    id: spriteBatchContainer
  }

  BorderElement {
    width: parent.width
    height: 10
  }
  BorderElement {
    y: parent.height-height
    width: parent.width
    height: 10
  }

  PlayerDragger {
    id: playerDragger
    x: level.width/2-width/2
    y: 10+height/2
    onMoveNow: character.moveNow()
    onReleasedNow: character.releasedNow()
  }

  PlayerFollower {
    id: character
    entityId: "player1"
    x: level.width/2-width/2
    y: 10+height/2
    realTarget: playerDragger
  }

  PlayerDragger {
    id: playerDragger2
    x: level.width/2-width/2
    y: level.height-10-height/2
    onMoveNow: character2.moveNow()
    onReleasedNow: character2.releasedNow()
  }

  PlayerFollower {
    id: character2
    entityId: "player2"
    x: level.width/2-width/2
    y: level.height-10-height/2
    realTarget: playerDragger2
  }

}
