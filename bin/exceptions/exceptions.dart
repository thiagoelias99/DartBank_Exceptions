import '../models/account.dart';

class InvalidIdException implements Exception {
  int id;

  InvalidIdException({required this.id}) {}
}

class InsuficientFundsException implements Exception {
  Account account;
  double amount;

  InsuficientFundsException({required this.account, required this.amount}) {}
}
