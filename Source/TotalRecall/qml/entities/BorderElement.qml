import VPlay 1.0
import QtQuick 1.1
import ".."

EntityBase {
  id: border
  entityType: "border"

  BoxCollider {
    id: collider
    width: parent.width
    height: parent.height
    bodyType: Body.Static
  }
  DebugVisual {
    width: parent.width
    height: parent.height
    color: "blue"
  }

}
