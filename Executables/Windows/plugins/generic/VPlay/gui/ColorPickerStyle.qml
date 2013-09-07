import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass ColorPickerStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The ColorPickerStyle is used for styling the ColorPicker elements.

  The ColorPickerStyle includes different properties which are used to skin and style the ColorPicker element.

  \section1 Example Usage
  This example shows the ColorPickerSkin which uses the ColorPickerStyle element as base style and extends it to a skin for proper use as ColorPicker skin. Furthermore it overrides an existing property with the new value #ffffff.

  \qml
  ColorPickerStyle {
    id: colorPickerSkin
    textColor: "#ffffff"
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: colorPickerStyle

  /*!
    The property textColor defines the text color of the ColorPicker element. The default value is set to UI.COLOR_TEXT.
  */
  property color textColor: UI.COLOR_TEXT

  /*!
    The property contentWidth defines the default width of the ColorPicker element. The default value is set to 100.
  */
  property int contentWidth: 100

  /*!
    The property rightMargin defines the default margin from the right side of the ColorPicker. The default value is set to 10.
  */
  property int rightMargin: 10

  /*!
    The property leftMargin defines the default margin from the left side of the ColorPicker. The default value is set to 10.
  */
  property int leftMargin: 10

  /*!
    The property topMarginElements defines the default margin from the top side of the different elements. The default value is set to 10.
  */
  property int spacing: 6
}
