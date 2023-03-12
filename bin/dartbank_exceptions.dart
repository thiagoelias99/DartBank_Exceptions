import 'controllers/bank_controller.dart';
import 'exceptions/exceptions.dart';
import 'models/account.dart';

void main() {
  // Bank creation
  BankController bankController = BankController();

  // Add Accounts
  bankController.addAccount(
      account: Account(id: 1, name: "Thiago Elias", balance: 400));

  bankController.addAccount(
      account: Account(id: 2, name: "Sara Costa", balance: 600));

  bankController.addAccount(
      account: Account(id: 3, name: "Bianca Diniz", balance: 800));

  // Do transfers
  try {
    bool result =
        bankController.makeTransfer(idSender: 1, idReceiver: 2, amount: 700);
    print("Transferência Realizada");
  } on InvalidIdException catch (e) {
    print("O id '${e.id}' não é valido");
  } on InsuficientFundsException catch (e) {
    print("A conta de '${e.account.name}' não possui saldo suficiente.");
    print("Saldo atual: ${e.account.balance}");
    print("Valor da Transferência: ${e.amount}");
  } catch (e) {
    print("Ocorreu um erro '${e.toString()}'");
  }
}
