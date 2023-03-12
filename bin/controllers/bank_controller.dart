import '../exceptions/exceptions.dart';
import '../models/account.dart';

class BankController {
  final Map<int, Account> _database = {};

  //Method to add a account to DB
  addAccount({required Account account}) {
    _database[account.id] = account;
  }

  //Method to transfer amount between accounts
  bool makeTransfer(
      {required int idSender,
      required int idReceiver,
      required double amount}) {
    //Check if ids are valid
    if (!verifyId(idSender)) {
      throw InvalidIdException(id: idSender);
    }

    if (!verifyId(idReceiver)) {
      throw InvalidIdException(id: idReceiver);
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Check if sender has suficient amount
    if (accountSender.balance < amount) {
      throw InsuficientFundsException(account: accountSender, amount: amount);
    }

    // If ok, do the transation
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  //Method thats checks if is a valid account
  bool verifyId(int id) {
    return _database.containsKey(id);
  }
}
