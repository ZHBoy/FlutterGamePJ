import 'package:flutter/material.dart';

alertDialog(
  context,
  title,
) async {
  var alertDialogs = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("玩法提示"),
          content: Text(title),
          actions: <Widget>[
            FlatButton(
                child: Text("了然"),
                onPressed: () => Navigator.pop(context, "yes")),
          ],
        );
      });
  return alertDialogs;
}
