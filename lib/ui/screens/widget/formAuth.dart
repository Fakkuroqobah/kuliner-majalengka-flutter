import 'package:flutter/material.dart';

import '../../constants/style.dart';

class FormAuth extends StatelessWidget {
  final BuildContext context;
  final String hint; 
  final IconData icon; 
  final TextInputType type; 
  final TextInputAction action; 
  final TextEditingController textEditingController;
  final FocusNode focusNow; 
  final Function validator;
  final FocusNode focusNext; 
  final bool obsecure;
  final String errorText;

  const FormAuth({
    Key key, 
    @required this.context, 
    @required this.hint, 
    @required this.icon, 
    @required this.type, 
    @required this.action, 
    @required this.textEditingController, 
    @required this.focusNow, 
    this.validator,
    this.focusNext,
    this.obsecure = false,
    this.errorText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: type,
      textInputAction: action,
      obscureText: obsecure,
      focusNode: focusNow,
      cursorColor: Style.primary,
      validator: validator,
      onFieldSubmitted: (v){
        FocusScope.of(context).requestFocus(focusNext);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Style.primary),
        hintText: hint,
        errorText: (errorText != "") ? errorText : null,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
        enabledBorder: outlineInputBorder(Colors.white),
        focusedBorder: outlineInputBorder(Style.primary),
        errorBorder: outlineInputBorder(Colors.red),
        focusedErrorBorder: outlineInputBorder(Colors.red)
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(Color color) { 
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      borderSide: BorderSide(
        color: color
      )
    );
  }
}