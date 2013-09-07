

function init() {

  for(var i = 0; i<10; ++i) {
    var propability = Math.random()
    // everything is allowed in middle rails
  //  if(propability < 0.5) {
  //    return "sender"
  //  } else {
  //    return "receiver"
  //  }

    var randomPosX = Math.random()*level.width
    var randomPosY = Math.random()*level.height

    entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("entities/Pedestrian.qml"),
                                                  {"x": randomPosX,
                                                    "y": randomPosY
                                                  });
  }

}
