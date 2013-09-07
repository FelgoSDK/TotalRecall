import QtQuick 1.1
import VPlay 1.0

import "UIConstants.js" as UI

/*!
  \qmlclass SliderStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The SliderStyle is used for styling slider elements.

  The SliderStyle includes different properties which are used to skin and style the slider gui element.

  \section1 Example Usage
  This example shows the SliderSkin which uses the SliderStyle element as base style and extends it to a skin for proper use as slider GUI skin. Furthermore it overrides an existing property with the new value #ffffff.

  \qml
  SliderStyle {
    id: sliderSkin
    textColor: "#ffffff"
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: sliderStyle
  /*!
    The property textColor defines the text color of the Slider element. The default value is set to UI.COLOR_TEXT.
  */
  property color textColor: UI.COLOR_TEXT

  /*!
    The property trackColor defines the track color of the Slider element. The default value is set to UI.COLOR_SIGNAL.
  */
  property color trackColor: UI.COLOR_SIGNAL

  /*!
    The property grooveColor defines the groove color of the Slider element. The default value is set to UI.COLOR_SECONDARY_FOREGROUND.
  */
  property color grooveColor: UI.COLOR_SECONDARY_FOREGROUND

  /*!
    The property handleColor defines the handle color of the Slider element. The default value is set to UI.COLOR_FOREGROUND.
  */
  property color handleColor: UI.COLOR_FOREGROUND

  /*!
    The property indicatorColor defines the indicator color of the Slider element. The default value is set to #49729E.
  */
  property color indicatorColor:  "#49729E"

  /*!
    The property valueBackground defines the image of the value tooltip background. The default value is set to "img/slider-handle-value-background-sd.png".
  */
  property url valueBackground: usingImage ? "img/slider-handle-value-background-sd.png" : ""

  /*!
    The property labelArrowDown defines the image of the arrow down. The default value is set to "img/slider-handle-label-arrow-down.png".
  */
  property url labelArrowDown: usingImage ? "img/slider-handle-label-arrow-down.png" : ""

  /*!
    The property labelArrowUp defines the image of the arrow up. The default value is set to "img/slider-handle-label-arrow-up.png".
  */
  property url labelArrowUp: usingImage ? "img/slider-handle-label-arrow-up.png" : ""

  /*!
    The property labelArrowLeft defines the image of the arrow left. The default value is set to "img/slider-handle-label-arrow-left.png".
  */
  property url labelArrowLeft: usingImage ? "img/slider-handle-label-arrow-left.png" : ""

  /*!
    The property labelArrowRight defines the image of the arrow right. The default value is set to "img/slider-handle-label-arrow-right.png".
  */
  property url labelArrowRight: usingImage ? "img/slider-handle-label-arrow-right.png" : ""

  /*!
    The property handleBackground defines the image of the handle background. The default value is set to "img/slider-handle-sd.png".
  */
  property url handleBackground: usingImage ? "img/slider-handle-sd.png" : ""

  /*!
    The property grooveItemBackground defines the image of the groove item. The default value is set to "img/slider-background-sd.png".
  */
  property url grooveItemBackground: usingImage ? "img/slider-background-sd.png" : ""

  /*!
    The property handleHeight defines the height of the slider handle when no image is used. The default value is set to 35.
  */
  property int handleHeight: 35

  /*!
    The property handleWidth defines the width of the slider handle when no image is used. The default value is set to 35.
  */
  property int handleWidth: 35

  /*!
    The property trackHeight defines the height of the slider track when no image is used. The default value is set to 6.
  */
  property int trackHeight: 6

  /*!
    The property grooveHeight defines the height of the slider groove when no image is used. The default value is set to 8.
  */
  property int grooveHeight: 8

  /*!
    The property mouseMarginRight defines the right margin of the mouse area use for the slider handle. The default value is set to UI.MARGIN_DEFAULT.
  */
  property real mouseMarginRight: UI.MARGIN_DEFAULT

  /*!
    The property mouseMarginLeft defines the left margin of the mouse area use for the slider handle. The default value is set to UI.MARGIN_DEFAULT.
  */
  property real mouseMarginLeft: UI.MARGIN_DEFAULT

  /*!
    The property mouseMarginTop defines the top margin of the mouse area use for the slider handle. The default value is set to UI.MARGIN_DEFAULT.
  */
  property real mouseMarginTop: UI.MARGIN_DEFAULT

  /*!
    The property mouseMarginBottom defines the bottom margin of the mouse area use for the slider handle. The default value is set to UI.MARGIN_DEFAULT.
  */
  property real mouseMarginBottom: UI.MARGIN_DEFAULT

  /*!
    This property defines the left margin of the value track. The default value is set to 2.
  */
  property real valueTrackLeftMargin: 2

  /*!
    This property defines the top margin of the value track. The default value is set to 2.
  */
  property real valueTrackTopMargin: 2

  /*!
    This property defines the bottom margin of the value track. The default value is set to 2.
  */
  property real valueTrackBottomMargin: 2
}
