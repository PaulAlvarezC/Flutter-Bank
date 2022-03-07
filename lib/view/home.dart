import 'package:bank_account/components/message.dart';
import 'package:bank_account/model/Account.dart';
import 'package:bank_account/view/deposit.dart';
import 'package:bank_account/view/addAccount.dart';
import 'package:bank_account/model/Person.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String _title;
  Home(this._title);
  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  List<Person> person = [
    new Person(
      '0401504386',
      'Claudia',
      'Arcos',
      '0984750300',
      new Account('0401504386', '102030', 800),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
        backgroundColor: Colors.lightBlue,
      ),
      body: ListView.builder(
        itemCount: person.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Deposit(person[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    person.removeAt(index);
                    person.insert(index, newContact);
                  });
                }
              });
            },
            //PARA ELIMINAR MANTENER PRESIONADO EL ELEMENTO DE LA LISTA
            onLongPress: () {
              removePerson(context, person[index]);
            },

            //AQUI SE MUESTRA LOS DATOS DE LA LISTA
            title: Text(person[index].getName + " " + person[index].getSurname),
            subtitle: Text(person[index].getId +
                "               \$ " +
                person[index].getAccount.account_amount.toStringAsFixed(2) +
                " USD"),
            //Circulo de avatar con la primera letra
            leading: CircleAvatar(
              child: Text(person[index].getName.substring(0, 1) +
                  person[index].getSurname.substring(0, 1)),
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
            ),
            trailing: Icon(
              Icons.currency_exchange,
              color: Colors.green,
              size: 38,
            ),
          );
        },
      ),

      //BOTON AGREGAR
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => AddAccount()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                person.add(newContact);
                messageResponse(context, "La cuenta se ha creado con exito!!!");
              });
            }
          });
        },
        tooltip: "Agregar Cuenta Persona",
        child: Icon(Icons.add),
        hoverColor: Colors.blueGrey,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
    );
  }

  removePerson(BuildContext context, Person person) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Eliminar Cuenta"),
              content: Text("Esta seguro de eliminar a " +
                  person.getName +
                  " " +
                  person.getSurname +
                  " de las cuentas bancarias?"),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      this.person.remove(person);
                      Navigator.pop(context);
                      messageResponse(
                          context, "La cuenta se ha eliminado con exito!!!");
                    });
                  },
                  child: Text(
                    "Eliminar",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancelar",
                    style: TextStyle(color: Colors.blue),
                  ),
                )
              ],
            ));
  }
}
