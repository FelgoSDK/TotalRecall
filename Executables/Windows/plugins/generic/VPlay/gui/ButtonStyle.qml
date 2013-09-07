import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass ButtonStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The ButtonStyle is used for styling the Button elements.

  The ButtonStyle includes different properties which are used to skin and style the Button element.

  \section1 Example Usage
  This example shows the ButtonSkin which uses the ButtonStyle element as base style and extends it to a skin for proper use as Button skin. Furthermore it overrides an existing property with the new value "img/no-button-sd.png".

  \qml
  ButtonStyle {
    id: buttonSkin
    buttonImage: "img/no-button-sd.png"
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: buttonStyle

  /*!
    The property buttonImage defines the image of the Button item. The default value is set to "img/button-sd.png".
  */
  property url buttonImage: usingImage ? "img/button-sd.png" : ""

}
