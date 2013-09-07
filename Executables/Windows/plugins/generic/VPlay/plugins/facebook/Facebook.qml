import QtQuick 1.1

Item {
  property string appId
  property variant publishPermissions
  property variant readPermissions
  property variant sessionState

  property string accessToken
  property variant grantedPermissions

  signal getGraphRequestFinished(string graphPath, int resultState, string result)
  signal openWallDialogFinished(int resultState, string result)
  signal postGraphRequestFinished(string graphPath, int resultState, string result)

  function closeSession() { }
  function getGraphRequest(graphPath, params) { }
  function openSession() { }
  function openWallDialog(params) { }
  function postGraphRequest(graphPath, params) { }
}
