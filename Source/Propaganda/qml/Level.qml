import VPlay 1.0
import QtQuick 1.1
import "entities"

Item {
  id: level

  SpriteBatchContainer {
    id: spriteBatchContainer
  }

  function reset() {

      playerDragger.x= level.width/2-playerDragger.width/2
      playerDragger.y= 10+50

      character.x= level.width/2-playerDragger.width/2
      character.y= 10+50

      playerDragger2.x= level.width/2-playerDragger.width/2
      playerDragger2.y= level.height-10-50

      character2.x= level.width/2-playerDragger.width/2
      character2.y= level.height-10-50
  }

  PlayerDragger {
    id: playerDragger
    onMoveNow: character.moveNow()
    onReleasedNow: character.releasedNow()
  }

  PlayerFollower {
    id: character
    entityId: "r"
    realTarget: playerDragger
  }

  PlayerDragger {
    id: playerDragger2
    onMoveNow: character2.moveNow()
    onReleasedNow: character2.releasedNow()
  }

  PlayerFollower {
    id: character2
    entityId: "g"
    realTarget: playerDragger2
  }
}
