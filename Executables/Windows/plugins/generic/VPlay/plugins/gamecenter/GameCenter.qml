import QtQuick 1.1

Item {
  property bool authenticated: false

  signal scoreReported(bool success)
  signal achievementReported(bool success)
  signal achievementsReset(bool success)

  function authenticateLocalPlayer() { }
  function showLeaderboard(category) { }
  function showAchievements() { }
  function reportScore() { }
  function resetAchievements() { }
  function getGameCenterScore(category) { return -1; }
}
