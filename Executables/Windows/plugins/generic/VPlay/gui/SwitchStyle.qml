import QtQuick 1.1
import VPlay 1.0
import "UIConstants.js" as UI

/*!
  \qmlclass SwitchStyle
  \inqmlmodule VPlay 1.0
  \ingroup vplay
  \ingroup gui
  \inherits Style
  \brief The SwitchStyle is used for styling switch elements.

  The SwitchStyle includes different properties which are used to skin and style the switch GUI element.

  \section1 Example Usage
  This example shows the SwitchSkin which uses the SwitchStyle element as base style and extends it to a skin for proper use as switch GUI skin. Furthermore it overrides an existing property with the new value 6.

  \qml
  SwitchStyle {
    id: switchSkin
    minKnobX: 6
  }
  \endqml

  \sa Style
  \sa {GUIElements Test}
*/
Style {
  id: switchStyle

  /*!
    The property minKnobX defines the minimal offset of the knob to the other side. The default value is set to 1.
  */
  property int minKnobX: 1

  /*!
    The property maxKnobX defines the maximal offset of the knob to the other side. The default value is set to 26.
  */
  property int maxKnobX: 26

  /*!
    The property switchOn defines the image of the slider of the knob when turned on. The default value is set to "img/switch-on-sd.png".
  */
  property url switchOn: usingImage ? "img/switch-on-sd.png" : ""

  /*!
    The property switchOff defines the image of the slider of the knob when turned off. The default value is set to "img/switch-off-sd.png".
  */
  property url switchOff: usingImage ? "img/switch-off-sd.png" : ""

  /*!
    The property thumb defines the image of the knob. The default value is set to "img/switch-thumb-sd.png".
  */
  property url thumb: usingImage ? "img/switch-thumb-sd.png" : ""

  /*!
    The property mouseMarginRight defines the right margin of the mouse area use for the slider handle. The default value is set to -UI.MARGIN_XLARGE.
  */
  property real mouseMarginRight: -UI.MARGIN_XLARGE

  /*!
    The property mouseMarginLeft defines the left margin of the mouse area use for the slider handle. The default value is set to -UI.MARGIN_XLARGE.
  */
  property real mouseMarginLeft: -UI.MARGIN_XLARGE

  /*!
    The property mouseMarginTop defines the top margin of the mouse area use for the slider handle. The default value is set to -UI.MARGIN_XLARGE.
  */
  property real mouseMarginTop: -UI.MARGIN_XLARGE

  /*!
    The property mouseMarginBottom defines the bottom margin of the mouse area use for the slider handle. The default value is set to -UI.MARGIN_XLARGE.
  */
  property real mouseMarginBottom: -UI.MARGIN_XLARGE

  /*!
    The property transitionVelocity defines the velocity of the transition from the switch. The default value is set to 500.
  */
  property int transitionVelocity: 500

  /*!
    The property transitionMaximumEasingTime defines the maximum easing time of the transition from the switch. The default value is set to 0.
  */
  property int transitionMaximumEasingTime: 0
}
