var NUM_PEDESTRIANS = 30

function init() {

//  for(var i = 0; i<10; ++i) {
//    var propability = Math.random()
    // everything is allowed in middle rails
  //  if(propability < 0.5) {
  //    return "sender"
  //  } else {
  //    return "receiver"
  //  }

//    var randomPosX = Math.random()*level.width
//    var randomPosY = Math.random()*level.height

//    entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Pedestrian.qml"),
//                                                  {"x": randomPosX,
//                                                    "y": randomPosY
//                                                  });
//  }

    createPedestrians()

}

function createPedestrians() {
    for(var i = 0; i < NUM_PEDESTRIANS; i++) {
        var randomPosX = generateRandomValueBetween(20, level.width-20)
        var randomPosY = generateRandomValueBetween(20, level.height-20)

        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Pedestrian.qml"),
                                                      {"x": randomPosX,
                                                        "y": randomPosY
                                                      });
    }
}

function generateRandomValueBetween(minimum, maximum) {
    return Math.random()*(maximum-minimum) + minimum
}
