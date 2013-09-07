import QtQuick 1.1
import VPlay 1.0
import VPlay.gui 1.0

/*
  \qmlclass SwitchSkin
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \ingroup skins
  \inherits SwitchStyle
  \brief The SwitchSkin is used to skin the switch GUI element. It can be overridden by V-Play engine users to define their own skins.

  Each Switch element can be styled individually if the default style does not meet your requirements. Differences on different platforms are listed below.

  \section1 Example Usage
  This example shows how a SwitchSkin can be used to override the default skin of a Switch element. This SwitchSkin can be used to override the default Switch skin. Initial the skin uses images to define its visual representation.

  PersonalSwitchSkin.qml includes the skin which is used to override the default skin.

  \qml
  SwitchStyle {

  // TODO add style code

  }
  \endqml

  The PersonalSwitchSkin is instantiated and added to a switch element to override its default skin.

  \qml

  // TODO add style code

  \endqml

  The upper Switch uses the default skin, while the bottom switch uses a custom skin.

  \image custom-sliderskin.png

  \section1 Platform specific differences

  This SwitchSkin file is used as generic skin file on all platforms. Each platform uses a own skin file if differences occur.
  Currently there are no platform specific differences.

  \sa {SwitchStyle}
  \sa {GUIElements Test}
*/
SwitchStyle {
}
