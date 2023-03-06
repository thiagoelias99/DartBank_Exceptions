class Account {
  //Parameters
  String name;
  double balance;
  bool isAuthenticated;

  //Named, required constructor
  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated});

  //Method
  editBalance({required value}) {
    balance = balance + value;
  }
}
