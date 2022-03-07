// ignore_for_file: empty_constructor_bodies

import 'package:bank_account/model/Account.dart';

class Person {
  String _id;
  String _name;
  String _surname;
  String _phone;
  Account _account;

  Person.origin() {}

  Person(
      String id, String name, String surname, String phone, Account account) {
    this._id = id;
    this._name = name;
    this._surname = surname;
    this._phone = phone;
    this._account = account;
  }

  String get getId {
    return _id;
  }

  set setId(String id) {
    this._id = id;
  }

  String get getName {
    return _name;
  }

  set setName(String name) {
    this._name = name;
  }

  String get getSurname {
    return _surname;
  }

  set setSurname(String surname) {
    this._surname = surname;
  }

  String get getPhone {
    return _phone;
  }

  set setPhone(String phone) {
    this._phone = phone;
  }

  Account get getAccount {
    return _account;
  }

  set setAccount(Account account) {
    this._account = account;
  }

  // METODOS

  bool isAmount(obj1, obj2) {
    if (obj1 - obj2 >= 0) {
      return true;
    } else {
      return false;
    }
  }

  double retirementAmount(obj1, obj2) {
    return obj1 - obj2;
  }

  double depositAmount(obj1, obj2) {
    return obj1 + obj2;
  }
}
