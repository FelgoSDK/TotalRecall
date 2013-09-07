import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass ImageViewerStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The ImageViewerStyle is used for styling the ImageViewer elements.

  The ImageViewerStyle includes different properties which are used to skin and style the ImageViewer element.

  \section1 Example Usage
  This example shows the ImageViewerSkin which uses the ImageViewerStyle element as base style and extends it to a skin for proper use as ImageViewer skin. Furthermore it overrides an existing property with the new value #ffffff.

  \qml
  ImageViewerStyle {
    id: imageViewerSkin
    textColor: "#ffffff"
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: imageViewerStyle

  /*!
    The property textColor defines the text color of the ColorPicker element. The default value is set to UI.COLOR_TEXT.
  */
  property color textColor: UI.COLOR_TEXT

  /*!
    The property contentWidth defines the default width of the ColorPicker element. The default value is set to 100.
  */
  property int contentWidth: 100

  /*!
    The property rightMargin defines the default margin from the right side of the ImageViewer. The default value is set to 10.
  */
  property int rightMargin: 10

  /*!
    The property leftMargin defines the default margin from the left side of the ImageViewer. The default value is set to 10.
  */
  property int leftMargin: 10

  /*!
    The property topMarginElements defines the default margin from the top side of the different elements. The default value is set to 10.
  */
  property int spacing: 6

  /*!
    The property textureDisplaySize defines the size of preview display size of the image. The default value is set to 64.
  */
  property int textureDisplaySize: 64

  /*!
    The property seperatorSize defines the size of seperator between preview image and selective images. The default value is set to 2.
  */
  property int seperatorSize: 2

  /*!
    The property separatorColor defines the color of the seperator element. The default value is set to UI.COLOR_FOREGROUND.
  */
  property color separatorColor: UI.COLOR_FOREGROUND
}
