import QtQuick 1.1

Item {
  property bool sessionAutostart
  property string applicationKey

  function startSession() { }

  function logError(name, message) { }
  function logEvent() { }
  function logTimedEvent() { }
  function endTimedEvent() { }

  function setUserId(userId) { }
  function setUserAge(userAge) { }
  function setUserGender(isMale) { }

}
