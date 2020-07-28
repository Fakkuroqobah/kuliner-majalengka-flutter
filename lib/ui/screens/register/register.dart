import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/controllers/loading/loading_buttton/loading_button_controller.dart';
import '../../../core/controllers/user/user_controller.dart';
import '../../constants/style.dart';
import '../widget/formAuth.dart';

class Register extends StatelessWidget {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final TextEditingController txtConfirmPassword = TextEditingController();
  final FocusNode focusUsername = FocusNode();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusConfirmPassword = FocusNode();
  final FocusNode focusRegister = FocusNode();
  final UserController _userController = UserController();
  final LoadingButtonController _loadingButtonController = LoadingButtonController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: <Widget>[
                Text("Mari bergabung!", style: TextStyle(
                  fontFamily: "MontserratAlternatesBold",
                  fontSize: 24.0
                )),
                
                SizedBox(height: 8.0),
                Text("Buat akun mu dan lihatlah Kuliner Majalengka", style: TextStyle(
                  fontFamily: "MontserratAlternatesLight",
                  fontSize: 14.0
                )),

                SizedBox(height: 4.0),
                SizedBox(
                  width: 280.0,
                  height: 24.0,
                  child: Divider()
                ),

                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 14.0),
                      Observer(
                        builder: (_) {
                          return FormAuth(
                            context: context,
                            hint: "Username", 
                            icon: Icons.person, 
                            type: TextInputType.text, 
                            action: TextInputAction.next,
                            textEditingController: txtUsername,
                            focusNow: focusUsername,
                            focusNext: focusEmail,
                            errorText: (_userController.errorsOnRegister != null) 
                              ? (_userController.errorsOnRegister["user_name"] != null) 
                              ? _userController.errorsOnRegister["user_name"][0] 
                              : '' : '',
                            validator: (value) {
                              if(value.isEmpty) {
                                return "Username tidak boleh kosong";
                              }else if(value.length > 20) {
                                return "Username maksimal 20 huruf";
                              }
                              return null;
                            }
                          );
                        }
                      ),

                      SizedBox(height: 14.0),
                      Observer(
                        builder: (_) {
                          return FormAuth(
                            context: context,
                            hint: "Email", 
                            icon: Icons.mail, 
                            type: TextInputType.emailAddress, 
                            action: TextInputAction.next,
                            textEditingController: txtEmail,
                            focusNow: focusEmail,
                            focusNext: focusPassword,
                            errorText: (_userController.errorsOnRegister != null) 
                              ? (_userController.errorsOnRegister["user_email"] != null) 
                              ? _userController.errorsOnRegister["user_email"][0] 
                              : '' : '',
                            validator: (value) {
                              if(value.isEmpty) {
                                return "Email tidak boleh kosong";
                              }else if(!value.contains("@")) {
                                return "Penulisan Email tidak valid";
                              }
                              return null;
                            }
                          );
                        }
                      ),

                      SizedBox(height: 14.0),
                      Observer(
                        builder: (_) {
                          return FormAuth(
                            context: context,
                            hint: "Password", 
                            icon: Icons.lock, 
                            type: TextInputType.visiblePassword, 
                            action: TextInputAction.next, 
                            textEditingController: txtPassword,
                            obsecure: true,
                            focusNow: focusPassword,
                            focusNext: focusConfirmPassword,
                            errorText: (_userController.errorsOnRegister != null) 
                              ? (_userController.errorsOnRegister["user_password"] != null) 
                              ? _userController.errorsOnRegister["user_password"][0] 
                              : '' : '',
                            validator: (value) {
                              if(value.isEmpty) {
                                return "Password tidak boleh kosong";
                              }else if(value.length < 6) {
                                return "Password minimal 6 huruf";
                              }
                              return null;
                            }
                          );
                        }
                      ),

                      SizedBox(height: 14.0),
                      Observer(
                        builder: (_) {
                          return FormAuth(
                            context: context,
                            hint: "Konfirmasi Password", 
                            icon: Icons.lock, 
                            type: TextInputType.visiblePassword, 
                            action: TextInputAction.done, 
                            textEditingController: txtConfirmPassword,
                            obsecure: true,
                            focusNow: focusConfirmPassword,
                            focusNext: focusRegister,
                            errorText: (_userController.errorsOnRegister != null) 
                              ? (_userController.errorsOnRegister["confirm_password"] != null) 
                              ? _userController.errorsOnRegister["confirm_password"][0] 
                              : '' : '',
                            validator: (value) {
                              if(value.isEmpty) {
                                return "Konfirmasi Password tidak boleh kosong";
                              }else if(value.length < 6) {
                                return "Konfirmasi Password minimal 6 huruf";
                              }else if(txtPassword.text != txtConfirmPassword.text) {
                                return "Konfirmasi Password tidak sesuai";
                              }
                              return null;
                            }
                          );
                        }
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.0),
                SizedBox(
                  width: 150.0,
                  height: 40.0,
                  child: Observer(
                    builder: (_) {
                      return MaterialButton(
                        focusNode: focusRegister,
                        onPressed: _loadingButtonController.disabled ? () {} : () async {
                          ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
                          
                          if (_formKey.currentState.validate()) {
                            _loadingButtonController.isLoading("LOADING", Color(0xff9C9E9B), true);

                            if (connectivityResult != ConnectivityResult.none) {
                              Map<String, String> data = {
                                "username": txtUsername.text,
                                "email": txtEmail.text,
                                "password": txtPassword.text,
                                "confirmPassword": txtConfirmPassword.text
                              };

                              await _userController.register(data);
                              _loadingButtonController.isLoading("DAFTAR", Style.primary, false);
                            }
                          }
                        },
                        elevation: 0.0,
                        color: _loadingButtonController.bgLoading,
                        child: Text(_loadingButtonController.loading == "" 
                            ? "DAFTAR"
                            : _loadingButtonController.loading, 
                          style: TextStyle(color: Colors.white)),
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50.0)),
                          borderSide: BorderSide(
                            color: _loadingButtonController.bgLoading
                          )
                        ),
                      );
                    }
                  ),
                ),

                SizedBox(height: 14.0),
              ],
            ),
          )
        ],
      ),
    );
  }
}