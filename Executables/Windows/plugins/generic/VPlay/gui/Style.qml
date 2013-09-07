import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass Style
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits QtObject
  \brief The Style is the base item for each style class used for gui elements.

  The Style includes different parameters which are neccessary in every GUI element such as usingImage or fontFamily. The Style element can be used for further styles and should not be instantiated.

  \section1 Example Usage
  This example shows the SliderStyle which uses the Style element as base style and extends it for proper use as slider GUI style.

  \qml
  Style {
    id: sliderStyle

    property color textColor:       "#243240"
    property color trackColor:      "#3976B8"
  }
  \endqml

  Also see other styles which extends this style, for instance, the \l {SliderStyle} or \l {SwitchStyle} which provide more information about the correct usage of the style component for GUI elements.

  \sa {GUIElements Test}
*/
QtObject {
    id: styleClass

    /*!
      The property usingImage is used to set the type of visualisation of the gui element. It can be displayed with images (true) or with simple elements (false). The default value is set to true. Currently only the Slider element supports the version without images.
    */
    property bool usingImage: true;

    /*!
      The alias children extend the usability of nested elements because some style classes like SelectionDialogStyle
      are using nested elements (for example Text), which isn't allowed by QtObject; this fix makes this possible.
      */
    default property alias children: styleClass.__defaultPropertyFix

    /*!
      \internal
      The property __defaultPropertyFix is used to extend the usability of the style for nested elements
      */
    property list<QtObject> __defaultPropertyFix: [Item {}] //QML doesn't allow an empty list here

    /*!
      The property fontFamily is used as default font for each GUI element. The default value is set to UI.FONT_FAMILY
      */
    property string fontFamily: UI.FONT_FAMILY
    /*!
      The property fontPixelSize is used as default font size for each GUI element. The default value is set to UI.FONT_DEFAULT
      */
    property int fontPixelSize: UI.FONT_DEFAULT
    /*!
      The property opacityEnabled is used to define the opacity strength of a gui element when it is activated. The default value is set to UI.OPACITY_ENABLED
      */
    property real opacityEnabled: UI.OPACITY_ENABLED
    /*!
      The property opacityDisabled is used to define the opacity strength of a gui element when it is deactivated. The default value is set to UI.OPACITY_DISABLED
      */
    property real opacityDisabled: UI.OPACITY_DISABLED
}
