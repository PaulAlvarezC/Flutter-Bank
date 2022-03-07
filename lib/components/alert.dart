import 'package:flutter/material.dart';

messageAlertResponse(BuildContext context, String mensaje) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: Text("Advertencia!"),
            content: Text(mensaje),
          ));
}
