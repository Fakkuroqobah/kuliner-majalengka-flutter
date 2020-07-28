import 'package:connectivity/connectivity.dart';
import 'package:edge_alert/edge_alert.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/controllers/loading/loading_buttton/loading_button_controller.dart';
import '../../../core/controllers/user/user_controller.dart';
import '../../../core/utils/navigation.dart'; 
import '../../../core/utils/injector.dart';
import '../../constants/style.dart';
import '../../screens/home/home.dart';
import '../../screens/widget/formAuth.dart';

class Login extends StatelessWidget {
  final SharedPreferences preferences = locator<SharedPreferences>();
  final TextEditingController txtEmail = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();
  final FocusNode focusEmail = FocusNode();
  final FocusNode focusPassword = FocusNode();
  final FocusNode focusLogin = FocusNode();

  Future<bool> get _isLogin async {
    if (preferences.getString("userToken") != null) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final UserController _userController = UserController();
    final LoadingButtonController _loadingButtonController = LoadingButtonController();

    return FutureBuilder(
      future: _isLogin,
      builder: (context, snapshot) {
        if(!snapshot.hasData) return Text("");
        else if(!snapshot.data) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Image.asset('assets/images/auth.png', 
                          width: 260.0,
                          fit: BoxFit.fitWidth
                        ),

                        SizedBox(height: 14.0),
                        Text("Selamat Datang!", style: TextStyle(
                          fontFamily: "MontserratAlternatesBold",
                          fontSize: 24.0,
                        )),

                        SizedBox(height: 8.0),
                        Text("Mari jelajahi ribuan Kuliner Majalengka", style: TextStyle(
                          fontFamily: "MontserratAlternatesLight",
                          fontSize: 14.0,
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
                              FormAuth(
                                context: context,
                                hint: "Email", 
                                icon: Icons.person, 
                                type: TextInputType.emailAddress, 
                                action: TextInputAction.next, 
                                textEditingController: txtEmail,
                                focusNow: focusEmail,
                                focusNext: focusPassword,
                                validator: (value) {
                                  if(value.isEmpty) {
                                    return "Email tidak boleh kosong";
                                  }else if(!value.contains("@")) {
                                    return "Penulisan Email tidak valid";
                                  }
                                  return null;
                                }
                              ),

                              SizedBox(height: 14.0),
                              FormAuth(
                                context: context,
                                hint: "Password", 
                                icon: Icons.lock, 
                                type: TextInputType.visiblePassword, 
                                action: TextInputAction.done, 
                                textEditingController: txtPassword, 
                                obsecure: true,
                                focusNow: focusPassword,
                                focusNext: focusLogin,
                                validator: (value) {
                                  if(value.isEmpty) {
                                    return "Password tidak boleh kosong";
                                  }else if(value.length < 6) {
                                    return "Password terdiri dari 6 huruf";
                                  }
                                  return null;
                                }
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text("Lupa password?", style: TextStyle(
                              fontFamily: "MontserratAlternatesMedium",
                            )),
                          ],
                        ),

                        SizedBox(height: 14.0),
                        Center(
                          child: Observer(
                            builder: (_) {
                              return MaterialButton(
                                minWidth: 150.0,
                                height: 40.0,
                                focusNode: focusLogin,
                                onPressed: _loadingButtonController.disabled ? () {} : () async {
                                  ConnectivityResult connectivityResult = await (Connectivity().checkConnectivity());
                                  
                                  if (_formKey.currentState.validate()) {
                                    _loadingButtonController.isLoading("LOADING", Color(0xff9C9E9B), true);

                                    if (connectivityResult != ConnectivityResult.none) {
                                      await _userController.login(txtEmail.text, txtPassword.text);
                                      
                                      if(_userController.errorsOnLogin != "") {
                                        _loadingButtonController.isLoading("LOG IN", Style.primary, false);

                                        EdgeAlert.show(
                                          context, 
                                          title: 'Oops!',
                                          description: _userController.errorsOnLogin,
                                          backgroundColor: Colors.red,
                                          icon: Icons.clear
                                        );
                                      }
                                    }else{
                                      _loadingButtonController.isLoading("LOG IN", Style.primary, false);

                                      EdgeAlert.show(
                                        context, 
                                        title: 'Oops!', 
                                        description: "Periksa koneksi anda!", 
                                        backgroundColor: Colors.red, 
                                        icon: Icons.signal_wifi_off
                                      );
                                    }
                                  }
                                },
                                elevation: 0.0,
                                color: _loadingButtonController.bgLoading,
                                child: Text(_loadingButtonController.loading == "" 
                                    ? "LOG IN"
                                    : _loadingButtonController.loading, 
                                  style: TextStyle(color: Colors.white)
                                ),
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
                        Text("Atau menggunakan", style: TextStyle(
                          fontFamily: "MontserratAlternatesLight"
                        )),

                        SizedBox(height: 8.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {},
                                  elevation: 0.0,
                                  color: Color(0xff4064AC),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("assets/images/icons/fb.png", width: 12.0, color: Colors.white),
                                      SizedBox(width: 5.0),
                                      Text("Facebook", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              
                              SizedBox(width: 16.0),

                              Expanded(
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, "home");
                                  },
                                  elevation: 0.0,
                                  color: Color(0xffD44235),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("assets/images/icons/google.png", width: 18.0, color: Colors.white),
                                      SizedBox(width: 5.0),
                                      Text("Google", style: TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 18.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(text: 'Tidak punya akun? ', style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "MontserratAlternatesMedium"
                                  )),
                                  
                                  TextSpan(text: 'Daftar!', style: TextStyle(
                                    color: Style.primary,
                                    fontFamily: "MontserratAlternatesMedium",
                                  ), recognizer: TapGestureRecognizer()..onTap = () {
                                    locator<Navigation>().navigateTo("register");
                                  }),
                                ],
                              ),
                            )
                          ],
                        ),

                        SizedBox(height: 18.0)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }else{
          return Home();
        }
      }
    );
  }
}