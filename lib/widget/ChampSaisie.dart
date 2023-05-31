import 'package:flutter/material.dart';
import 'package:squelette_mobile_parcours/utils/ColorPage.dart';

Widget ChampSaisie(
    {bool isPassword = false,
      String label = "",
      String hintext="",
      IconData prefixIcon = Icons.edit,
      required TextEditingController ctrl,
      TextInputType type = TextInputType.text,
      bool required=false, required String? Function(String? value) validator,}) {
  return TextFormField(
      obscureText: isPassword,
      controller: ctrl,
      keyboardType: type,

      decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon,color: Utils.COLOR_ORANGE,),
          labelText: label,
          labelStyle: TextStyle(color: Utils.COLOR_NOIR,fontSize: 12),
          hintText: hintext, hintStyle: TextStyle(fontFamily: 'Schyler',fontSize: 12,),
        border: _bordure(Colors.grey),
        focusedBorder: _bordure(Utils.COLOR_ORANGE_CLAIR),
        errorBorder: _bordure(Utils.COLOR_ROUGE),
        enabledBorder: _bordure(Utils.COLOR_ORANGE_CLAIR),
        filled: true,
        contentPadding: EdgeInsetsDirectional.fromSTEB(14, 21, 0, 21),),
  validator: validator,);
}

OutlineInputBorder _bordure(Color _color) {
  return OutlineInputBorder(
      borderSide: BorderSide(width: 2, color: _color),
      borderRadius: BorderRadius.all(Radius.circular(8)));
}