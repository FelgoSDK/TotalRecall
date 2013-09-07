import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass GUIWindowStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The GUIWindowStyle is used for styling the window elements.

  The GUIWindowStyle includes different properties which are used to skin and style the GUIWindow element.

  \section1 Example Usage
  This example shows the ImageViewerSkin which uses the ImageViewerStyle element as base style and extends it to a skin for proper use as ImageViewer skin. Furthermore it overrides an existing property with the new value #ffffff.

  \qml
  GUIWindowStyle {
    id: GUIWindowSkin
    backgroundColor: "#ffffff"
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: guiWindowStyle

  /*!
    The property backgroundColor defines the background color of the GUIWindow element. The default value is set to UI.COLOR_BACKGROUND.
  */
  property color backgroundColor: UI.COLOR_BACKGROUND
  
  /*!
    The property background defines the image of the window. The default value is set to "img/window.png".
  */
  property url backgroundImage: usingImage ? "img/window.png" : ""
  
}
