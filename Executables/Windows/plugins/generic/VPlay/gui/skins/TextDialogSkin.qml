import QtQuick 1.1
import VPlay 1.0
import VPlay.gui 1.0

/*
  \qmlclass TextDialogSkin
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \ingroup skins
  \inherits TextDialogStyle
  \brief The TextDialogStyle is used to skin the text dialog GUI element. It can be overridden by V-Play engine users to define their own skins.

  Each TextDialog element can be styled individually if the default style does not meet your requirements. Differences on different platforms are listed below.

  \section1 Example Usage
  This example shows how a TextDialogSkin can be used to override the default skin of a TextDialog element. This TextDialogSkin can be used to override the default TextDialog skin. Initial the skin uses images to define its visual representation.

  PersonalTextDialogSkin.qml includes the skin which is used to override the default skin.

  \qml
  TextDialogStyle {

  // TODO add style code

  }
  \endqml

  The PersonalTextDialogSkin is instantiated and added to a switch element to override its default skin.

  \qml

  // TODO add style code

  \endqml

  The upper TextDialog uses the default skin, while the bottom TextDialog uses a custom skin.

  \image custom-textdialogskin.png

  \section1 Platform specific differences

  This TextDialogSkin file is used as generic skin file on all platforms. Each platform uses a own skin file if differences occur.
  Currently there are no platform specific differences.

  \sa {TextDialogStyle}
  \sa {GUIElements Test}
*/
TextDialogStyle {
}
