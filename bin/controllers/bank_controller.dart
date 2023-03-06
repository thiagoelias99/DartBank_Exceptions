import '../models/account.dart';

class BankController {
  final Map<String, Account> _database = {};

  //Method to add a account to DB
  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  //Method to transfer amount between accounts
  bool makeTransfer(
      {required String idSender,
      required String idReceiver,
      required double amount}) {
    //Check if ids are valid
    if (!verifyId(idSender)) {
      return false;
    }

    if (!verifyId(idReceiver)) {
      return false;
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Check if sender is authenticated
    if (!accountSender.isAuthenticated) {
      return false;
    }

    // Check if sender has suficient amount
    if (accountSender.balance < amount) {
      return false;
    }

    // If ok, do the transation
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  //Method thats checks if is a valid account
  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
