import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
  // Bank creation
  BankController bankController = BankController();

  // Add Accounts
  bankController.addAccount(
      id: "Thiago",
      account:
          Account(name: "Thiago Elias", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Sara",
      account:
          Account(name: "Sara Costa", balance: 600, isAuthenticated: true));

  bankController.addAccount(
      id: "Bia",
      account:
          Account(name: "Bianca Diniz", balance: 800, isAuthenticated: false));

  // Do transfers
  bool result = bankController.makeTransfer(
      idSender: "Thiago", idReceiver: "Sara", amount: 700);
  print(result);
}
