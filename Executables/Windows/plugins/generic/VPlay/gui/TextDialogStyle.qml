import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass TextDialogStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The TextDialogStyle is used for styling text dialog elements.

  The TextDialogStyle includes different properties which are used to skin and style the text dialog GUI element.

  \section1 Example Usage
  This example shows the TextDialogSkin which uses the TextDialogStyle element as base style and extends it to a skin for proper use as text dialog GUI skin. Furthermore it overrides an existing property with the new value #ffffff.

  \qml
  TextDialogStyle {
    id: textDialogSkin
    textColor: "#ffffff"
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: textDialogStyle

  /*!
    The property textColor defines the text color of the TextDialog element. The default value is set to UI.COLOR_TEXT.
  */
  property color textColor: UI.COLOR_TEXT

  /*!
    The property backgroundColor defines the background color of the text dialog element. The default value is set to UI.COLOR_SECONDARY_FOREGROUND.
  */
  property color backgroundColor: UI.COLOR_SECONDARY_FOREGROUND
  
  /*!
    The property buttonColor defines the button color of the text dialog button element. The default value is set to UI.COLOR_FOREGROUND.
  */
  property color buttonColor: UI.COLOR_FOREGROUND

  /*!
    The property background defines the image of the text dialog. The default value is set to "img/text-dialog-background-sd.png".
  */
  property url backgroundImage: usingImage ? "img/text-dialog-background-sd.png" : ""
  
  /*!
    The property button defines the button image of the text dialog. The default value is set to "img/slider-handle-sd.png".
  */
  property url buttonImage: usingImage ? "img/slider-handle-sd.png" : ""

}
