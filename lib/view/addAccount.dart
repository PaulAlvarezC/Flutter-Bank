import 'package:bank_account/model/Person.dart';
import 'package:bank_account/model/Account.dart';
import 'package:bank_account/components/text_box.dart';
import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AddAccount();
}

class _AddAccount extends State<AddAccount> {
  TextEditingController controllerId;
  TextEditingController controllerName;
  TextEditingController controllerSurname;
  TextEditingController controllerPhone;

  TextEditingController controllerAccountId;
  TextEditingController controllerAccountNumber;
  TextEditingController controllerAccountAmount;

  @override
  void initState() {
    controllerId = new TextEditingController();
    controllerName = new TextEditingController();
    controllerSurname = new TextEditingController();
    controllerPhone = new TextEditingController();

    controllerAccountId = new TextEditingController();
    controllerAccountNumber = new TextEditingController();
    controllerAccountAmount = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registrar cuenta personal"),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView(
        children: [
          TextBox(controllerId, "Cédula"),
          TextBox(controllerName, "Nombre"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Telefono"),
          TextBox(controllerAccountNumber, "Número de cuenta"),
          TextBox(controllerAccountAmount, "Monto"),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlueAccent,
                fixedSize: const Size(300, 60),
                onPrimary: Colors.white,
                shadowColor: Colors.black,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
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
                String amount = controllerAccountAmount.text;
                double monto = double.parse(amount);

                if (id.isNotEmpty &&
                    name.isNotEmpty &&
                    surname.isNotEmpty &&
                    phone.isNotEmpty) {
                  Navigator.pop(
                    context,
                    new Person(
                      id,
                      name,
                      surname,
                      phone,
                      new Account(id, number, monto),
                    ),
                  );
                }
              },
              child: Text("Guardar")),
        ],
      ),
    );
  }
}
