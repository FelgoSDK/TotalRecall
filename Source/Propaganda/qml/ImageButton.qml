import VPlay 1.0
import QtQuick 1.1

Item {
    id: button

    property string text: "Image Button"
    property string normal: ""
    property string highlight: ""
    property string textColor: "#ffffff"
    property variant font
    property int textSize: 16
    property bool enabled: true

    property alias sound: clip.source

    signal clicked
    signal pressed
    signal released

    width: 99
    height: 31

    Image {
        id: image
        anchors.fill: parent
        source: button.normal
    }

    MouseArea {
        id: mouseArea
        enabled: button.enabled
        anchors.fill: button
        hoverEnabled: true

        onClicked: button.clicked()
        onPressed: button.pressed()
        onReleased: button.released()
    }

    Text {
        id: text
        font.family: button.font ? button.font : 0
        text: button.text
        color: button.textColor
        font.pixelSize: button.textSize
        anchors.centerIn: button
    }

    onClicked: {
    }

    onPressed: {
//        if(sound) clip.play();
        console.log("image button pressed");
      if(highlight)
        image.source = button.highlight;
    }

    onReleased: {
        console.log("image button released");
      if(highlight)
        image.source = button.normal;
    }

    function reset() {
        text.color = button.textColor;
        image.source = button.normal;
    }

    Sound {
        id: clip
        source: ""
    }
}
