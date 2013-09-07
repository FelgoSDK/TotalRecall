import QtQuick 1.1

Item {
  property string secret
  property int version
  property string androidPublicKey
  property bool supported

  property list<Currency> currencies
  property list<CurrencyPack> currencyPacks
  property list<Good> goods
  property list<NonConsumableGood> nonConsumables

  signal currencyBalanceChanged(string itemId, int balance, int amountAdded)
  signal goodBalanceChanged(string itemId, int balance, int amountAdded)
  signal goodEquipped(string itemId)
  signal goodUnequipped(string itemId)
  signal goodUpgrade(string itemId, string upgradeItemId)
  signal itemPurchased(string itemId)
  signal storePurchaseCancelled(string itemId)
  signal storePurchased(string itemId)
  signal storePurchaseStarted(string itemId)
  signal storeRefund(string itemId)
  signal restoreAllTransactionsStarted()
  signal restoreAllTransactionsFinished(bool success)
  signal unexpectedError()
  signal itemNotFoundError(string itemId)
  signal insufficientFundsError()

  // Store calls
  function buyStoreItem(itemId) { }
  function restoreAllTransactions() { }
  // Non consumables
  function nonConsumableItemExists(itemId) { }
  function addNonConsumableItem(itemId) { }
  function removeNonConsumableItem(itemId) { }
  // In-game items
  function buyItem(itemId) { }
  function getItemBalance(itemId) { }
  function giveItem(itemId, amount) { }
  function takeItem(itemId, amount) { }
  // Used for easy creation of csv files to upload to dev consoles
  function printStoreProductLists() { }
}
