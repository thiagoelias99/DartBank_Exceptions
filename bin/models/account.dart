class Account {
  //Parameters
  int id;
  String name;
  double balance;

  //Named, required constructor
  Account({required this.id, required this.name, required this.balance});

  //Method
  editBalance({required value}) {
    balance += value;
  }
}
