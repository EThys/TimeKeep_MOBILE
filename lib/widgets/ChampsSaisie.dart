import 'package:flutter/material.dart';

Widget ChampSaisie(
    {bool isPassword = false,
      String label = "",
      IconData prefixIcon = Icons.edit,
      required TextEditingController ctrl,
      TextInputType type = TextInputType.text,
      bool required=false}) {
  return TextFormField(
      obscureText: isPassword,
      controller: ctrl,
      keyboardType: type,
      validator: (String? value) {
        if(!required) return null;
        if ( value == null || value.isEmpty) {
          print("Champs obligatoire");
        }
        return null;
      },
      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          prefixIconColor: Colors.amber[900],
          hintText: label,
          border: _bordure(Colors.grey),
          focusedBorder: _bordure(Colors.amber),
          enabledBorder: _bordure(Colors.grey)
      )
  );
}

OutlineInputBorder _bordure(MaterialColor _color) {
  return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: _color),
      borderRadius: BorderRadius.all(Radius.circular(5))
  );
}