import QtQuick 1.1
import VPlay 1.0
import VPlay.gui 1.0

/*!
  \qmlclass SliderSkin
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \ingroup skins
  \inherits SliderStyle
  \brief The SliderSkin is used to skin the slider GUI element. It can be overridden by V-Play engine users to define their own skins.

  Each Slider element can be styled individually if the default style does not meet your requirements. Differences on different platforms are listed below.

  \section1 Example Usage
  This example shows how a SliderSkin can be used to override the default skin of a slider element. This SliderSkin can be used to override the default slider skin. Initial the skin uses images to define its visual representation.

  PersonalSliderSkin.qml includes the skin which is used to override the default skin.

  \qml
  SliderStyle {
    // background images
    valueBackground: usingImage ? "img/slider-handle-value-background-sd.png" : ""
    labelArrowDown: usingImage ? "img/slider-handle-label-arrow-down.png" : ""
    labelArrowUp: usingImage ? "img/slider-handle-label-arrow-up.png" : ""
    labelArrowLeft: usingImage ? "img/slider-handle-label-arrow-left.png" : ""
    labelArrowRight: usingImage ? "img/slider-handle-label-arrow-right.png" : ""
    handleBackground: usingImage ? "img/slider-handle-sd.png" : ""
    grooveItemBackground: usingImage ? "img/slider-background-sd.png" : ""
  }
  \endqml

  The PersonalSliderSkin is instantiated and added to a slider element to override its default skin.

  \qml
  import VPlay 1.0
  import QtQuick 1.1

  // This test uses only overrider skin if executed from a single project! It does not work within VPlayQML!
  GameWindow {
    id: rootGameWindow

    displayFpsEnabled: true

    Scene {
      id: scene

      // This personal slider skin, forces the gui element to use images
      PersonalSliderSkin {
        id: myOwnSkinForOneOrMoreElements
      }

      Column {
        anchors.centerIn: parent

        // slider with default skin
        Slider {
          width: 200
          valueIndicatorVisible: true
          minimumValue: 0
          maximumValue: scene.width
          stepSize: 1
        }

        // slider with custom skin
        Slider {
          width: 200
          valueIndicatorVisible: true
          minimumValue: 0
          maximumValue: scene.width
          stepSize: 1
          platformStyle: myOwnSkinForOneOrMoreElements
        }
      }
    } // end of Scene
  } // end of GameWindow
  \endqml

  The upper slider uses the default skin, while the bottom slider uses a custom skin.

  \image custom-sliderskin.png

  \section1 Platform specific differences

  This SliderSkin file is used as generic skin file on all platforms. Each platform uses a own skin file if differences occur.
  Currently there are no platform specific differences.

  \omit Following list shows the differences of the SliderSkin files for the desired platforms.

     \table
     \header
         \li Platform
         \li Images
     \row
         \li Linux
         \li enabled
     \row
         \li Windows
         \li enabled
     \row
         \li MAC
         \li enabled
     \row
         \li MeeGo Harmattan
         \li enabled
     \row
         \li Symbian
         \li enabled
     \row
         \li iOS
         \li enabled
     \row
         \li Android
         \li enabled
     \endtable
  \endomit

  \sa {SliderStyle}
  \sa {GUIElements Test}
*/
SliderStyle {
}
