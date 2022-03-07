import 'package:bank_account/model/Account.dart';
import 'package:bank_account/model/Person.dart';
import 'package:flutter/material.dart';
import 'package:bank_account/components/text_box.dart';
import 'package:bank_account/components/alert.dart';

class Deposit extends StatefulWidget {
  final Person _person;
  Deposit(this._person);
  @override
  State<StatefulWidget> createState() => _Deposit();
}

class _Deposit extends State<Deposit> {
  TextEditingController controllerId;
  TextEditingController controllerName;
  TextEditingController controllerSurname;
  TextEditingController controllerPhone;
  TextEditingController controllerAccountNumber;
  TextEditingController controllerAccountAmount;
  TextEditingController controllerAmountToGet;

  @override
  void initState() {
    Person c = widget._person;
    controllerId = new TextEditingController(text: c.getId);
    controllerName = new TextEditingController(text: c.getName);
    controllerSurname = new TextEditingController(text: c.getSurname);
    controllerPhone = new TextEditingController(text: c.getPhone);
    controllerAccountNumber =
        new TextEditingController(text: c.getAccount.account_number);
    controllerAccountAmount = new TextEditingController(
        text: c.getAccount.account_amount.toStringAsFixed(2));
    controllerAmountToGet = new TextEditingController(text: "");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Depósito / Retiro"),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: [
          TextBox(controllerId, "Cédula"),
          TextBox(controllerName, "Nombres"),
          TextBox(controllerSurname, "Apellido"),
          //TextBox(controllerPhone, "Teléfono"),
          TextBox(controllerAccountNumber, "Número de Cuenta"),
          //TextBox(controllerAccountAmount, "Saldo"),
          TextBox(controllerAmountToGet, "Monto"),

          //RETIRAR DINERO
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                fixedSize: const Size(300, 60),
                onPrimary: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                padding: EdgeInsets.all(5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onPressed: () {
                String id = controllerId.text;
                String name = controllerName.text;
                String surname = controllerSurname.text;
                String phone = controllerPhone.text;
                String number = controllerAccountNumber.text;

                if (controllerAmountToGet.text.isEmpty) {
                  messageAlertResponse(context, "Ingrese el monto a retirar.");
                } else {
                  if (controllerAmountToGet.text
                      .contains(new RegExp(r"[a-z]"))) {
                    messageAlertResponse(context, "Monto no válido!!!");
                    controllerAmountToGet.clear();
                  } else {
                    double saldo = double.parse(controllerAccountAmount.text);
                    double monto = double.parse(controllerAmountToGet.text);
                    Person per = new Person.origin();

                    if (per.isAmount(saldo, monto)) {
                      double newSaldo = per.retirementAmount(saldo, monto);
                      Navigator.pop(
                        context,
                        new Person(
                          id,
                          name,
                          surname,
                          phone,
                          new Account(id, number, newSaldo),
                        ),
                      );
                      messageAlertResponse(context, "Transacción exitosa!!!");
                      controllerAmountToGet.clear();
                    } else {
                      messageAlertResponse(context, "Saldo insuficiente");
                      controllerAmountToGet.clear();
                    }
                  }
                }
              },
              child: Text("Retirar monto"),
            ),
          ),

          //DEPOSITAR DINERO
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                fixedSize: const Size(300, 60),
                onPrimary: Colors.white,
                padding: EdgeInsets.all(20),
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                ),
              ),
              onPressed: () {
                String id = controllerId.text;
                String name = controllerName.text;
                String surname = controllerSurname.text;
                String phone = controllerPhone.text;
                String number = controllerAccountNumber.text;

                if (controllerAmountToGet.text.isEmpty) {
                  messageAlertResponse(
                      context, "Ingrese el monto a depositar.");
                } else {
                  if (controllerAmountToGet.text
                      .contains(new RegExp(r"[a-z]"))) {
                    messageAlertResponse(context, "Monto no válido!!!");
                    controllerAmountToGet.clear();
                  } else {
                    double saldo = double.parse(controllerAccountAmount.text);
                    double monto = double.parse(controllerAmountToGet.text);
                    Person per = new Person.origin();

                    double newSaldo = per.depositAmount(saldo, monto);
                    Navigator.pop(
                      context,
                      new Person(
                        id,
                        name,
                        surname,
                        phone,
                        new Account(id, number, newSaldo),
                      ),
                    );
                    messageAlertResponse(context, "Transacción exitosa!!!");
                    controllerAmountToGet.clear();
                  }
                }
              },
              child: Text("Depositar monto"),
            ),
          ),
        ],
      ),
    );
  }
}
