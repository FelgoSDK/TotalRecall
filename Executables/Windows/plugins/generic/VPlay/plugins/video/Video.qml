import QtQuick 1.1

Item {
  property url source
  property bool autoPlay: false
  property bool looping: false
  property bool fullscreen: false
  property bool controlsEnabled: false

  signal started
  signal paused
  signal stopped
  signal ended

  function play() { }
  function pause() { }
  function stop() { }
}
