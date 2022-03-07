// ignore_for_file: non_constant_identifier_names

class Account {
  String _id;
  String _number;
  double _amount;

  Account(String id, String number, double amount) {
    this._id = id;
    this._number = number;
    this._amount = amount;
  }

  String get account_id {
    return _id;
  }

  set account_id(String id) {
    this._id = id;
  }

  String get account_number {
    return _number;
  }

  set account_number(String number) {
    this._number = number;
  }

  double get account_amount {
    return _amount;
  }

  set account_amount(double amount) {
    this._amount = amount;
  }

  void displayAmount() {
    print(_amount);
  }
}
