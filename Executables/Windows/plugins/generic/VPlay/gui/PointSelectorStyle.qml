import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass PointSelectorStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The PointSelectorStyle is used for styling the PointSelector elements.

  The PointSelectorStyle includes different properties which are used to skin and style the PointSelector element.

  \section1 Example Usage
  This example shows the PointSelectorSkin which uses the PointSelectorStyle element as base style and extends it to a skin for proper use as PointSelector skin. Furthermore it overrides an existing property with the new value #ffffff.

  \qml
  PointSelectorStyle {
    id: pointSelectorSkin
    backgroundColor: "#ffffff"
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: pointSelectorStyle

  /*!
    The property backgroundColor defines the background color of the PointSelector element. The default value is set to UI.COLOR_BACKGROUND.
  */
  property color backgroundColor: UI.COLOR_BACKGROUND

  /*!
    The property contentWidth defines the default width of the ColorPicker element. The default value is set to 100.
  */
  property int contentWidth: 100
}
