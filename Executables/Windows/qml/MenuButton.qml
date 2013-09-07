import VPlay 1.0
import QtQuick 1.1

Item {
  id: button

  width: buttonImage.width + videoImage.width + 20
  height: videoImage.height

  property variant text: "Button"
  property int rotation: 0
  property string video: "videos/jetzt.mp4"

  signal clicked
  signal pressed
  signal released

  signal videoClicked
  signal videoPressed
  signal videoReleased

  Image {
    id: videoImage
    source: "Shop/images/filmklappe.png"
    width: 44 * 1.1
    height: 47 * 1.1
    z: 5
    mirror: { return button.rotation < 0 }

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onClicked: button.videoClicked()
      onPressed: button.videoPressed()
      onReleased: button.videoReleased()
    }

    Behavior on y {
      NumberAnimation { duration: 50 }
    }
  }

  Image {
    id: buttonImage
    source: "Shop/images/button.png"
    width: 168 * 1.1
    height: 40 * 1.1
    z: 5
    rotation: button.rotation

    anchors.verticalCenter: button.verticalCenter
    anchors.right: button.right

    Text {
      text: button.text
      font.pixelSize: 20
      //font.family: pisang.name
      anchors.horizontalCenter: buttonImage.horizontalCenter
      anchors.verticalCenter: buttonImage.verticalCenter
    }

    MouseArea {
      anchors.fill: parent
      hoverEnabled: true
      onClicked: button.clicked()
      onPressed: button.pressed()
      onReleased: button.released()
    }

    Behavior on anchors.verticalCenterOffset {
      NumberAnimation { duration: 50 }
    }
  }

  onClicked: {

  }

  onPressed: {
    audioManager.play(audioManager.idBUTTON)
    buttonImage.source = "Shop/images/button_pressed.png";
    buttonImage.anchors.verticalCenterOffset = buttonImage.anchors.verticalCenterOffset + 1;
  }

  onReleased: {
    buttonImage.source = "Shop/images/button.png";
    buttonImage.anchors.verticalCenterOffset = buttonImage.anchors.verticalCenterOffset - 1;
  }

  onVideoClicked: { }

  onVideoPressed: {
    audioManager.play(audioManager.idBUTTON)
    videoImage.source = "Shop/images/filmklappe_pressed.png";
    videoImage.y = videoImage.y + 1;
    videoImage.mirror = false;
    videoImage.mirror = button.rotation < 0;
  }

  onVideoReleased: {
    videoImage.source = "Shop/images/filmklappe.png";
    videoImage.y = videoImage.y - 1;
    videoImage.mirror = false;
    videoImage.mirror = button.rotation < 0;
    console.log("videoImage.mirror: " + videoImage.mirror);

    videoPopup.videoSource = video
    videoPopup.enabled = true;
  }
}


