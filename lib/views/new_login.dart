import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:official_fortline_app/views/constants/constants.dart';
import 'package:official_fortline_app/views/signup_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/utils.dart';
import 'forgot_password_screen.dart';
import 'home.dart';
import 'otp.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:local_auth/local_auth.dart';

class NewLogin extends StatefulWidget {
  const NewLogin({Key? key}) : super(key: key);

  @override
  State<NewLogin> createState() => _NewLoginState();
}

class _NewLoginState extends State<NewLogin> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _hidePassword = ValueNotifier<bool>(true);
  String _password = "";
  String _emailPhoneOrUser = "";
  List<BiometricType> _bioMetrics = [];
  final LocalAuthentication auth = LocalAuthentication();
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, () async{
      final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
      final bool canAuthenticate =
          canAuthenticateWithBiometrics || await auth.isDeviceSupported();
      print("canAuthenticateWithBiometrics $canAuthenticateWithBiometrics");
      print("canAuthenticate $canAuthenticate");
      if(canAuthenticate){
        try{
       _bioMetrics = await auth.getAvailableBiometrics();
       print("finger support: ${_bioMetrics.contains(BiometricType.fingerprint)}");
       print("face support: ${_bioMetrics.contains(BiometricType.face)}");
       print("biometrics: $_bioMetrics");
       if(_bioMetrics.contains(_bioMetrics.contains(BiometricType.fingerprint) || _bioMetrics.contains(BiometricType.face))) {
         setState(() {

         });
       }
       } on PlatformException catch(e){

        }
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    print("device height ${size.height}");
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    alignment: Alignment.bottomLeft,
                    image: AssetImage("assets/images/otp_bg.png"),
                    fit: BoxFit.fitWidth
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Image.asset("assets/images/logo.png",
                      width: size.width * 0.35,
                      //fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 50,),
                  const Expanded(flex: 1,child: Text("Let's Sign you in",
                    style: TextStyle(
                        color: Color(0xffED1C24),
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  ),
                  const Expanded(child: Text("Enabling Technology To The Next Level",
                    style: TextStyle(
                      color: Color(0xff808080),
                      fontSize: 15,
                    ),
                  ),
                  ),
                  Expanded(flex: 9,child: LayoutBuilder(
                      builder: (context, constraints) {
                        double maxHeight = constraints.maxHeight;
                        return Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: TextFormField(

                                  decoration: const InputDecoration(
                                      focusedBorder:OutlineInputBorder(
                                          borderSide: BorderSide(color: Color(0xffED1C24)),
                                          borderRadius: BorderRadius.all(Radius.circular(12))
                                      ),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(12))
                                      ),
                                      hintText: "Phone, email or username"
                                  ),
                                    validator: (val){
                                    if(val!.contains(RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")) || val!.contains(RegExp(r'^\+[1-9]{1}[0-9]{3,14}$'))){
                                      return null;
                                    }
                                    else{
                                      return "Please enter valid Email or Mobile number";
                                    }
                                    },
                                    onSaved: (val){
                                      _emailPhoneOrUser = val!;
                                    }
                                ),
                              ),
                              SizedBox(height: maxHeight * 0.05,),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: ValueListenableBuilder<bool>(
                                  builder: (context, val, wid) {
                                    if(val){
                                      return TextFormField(
                                          decoration: InputDecoration(
                                              focusedBorder:OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xffED1C24)),
                                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                              ),
                                              hintText: "Password",
                                              suffixIcon: InkWell(
                                                onTap: (){
                                                  _hidePassword.value = false;
                                                },
                                                child: Icon(Icons.visibility_off_outlined),
                                              )
                                          ),
                                          obscureText: val,
                                          validator: (val){
                                            if(val!.length < 7){
                                              return "Invalid password";
                                            }
                                            return null;
                                          },
                                          onSaved: (val){
                                            _password = val!;
                                          }
                                      );
                                    }
                                    else{
                                      return TextFormField(
                                          decoration: InputDecoration(
                                              focusedBorder:OutlineInputBorder(
                                                  borderSide: BorderSide(color: Color(0xffED1C24)),
                                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                              ),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(12))
                                              ),
                                              hintText: "Password",
                                              suffixIcon: InkWell(
                                                onTap: (){
                                                  _hidePassword.value = true;
                                                },
                                                child: Icon(Icons.visibility_outlined),
                                              )
                                          ),
                                          obscureText: val,
                                          validator: (val){
                                            if(val!.length < 7){
                                              return "Invalid password";
                                            }
                                            return null;
                                          },
                                          onSaved: (val){
                                            _password = val!;
                                          }
                                      );
                                    }
                                  },
                                  valueListenable: _hidePassword,
                                ),
                              ),
                              SizedBox(height: maxHeight * 0.07,),
                              InkWell(
                                child: Container(
                                  width: size.width * 0.55,
                                  height: maxHeight * 0.07,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffED1C24),
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: const Center(child: Text("Sign In",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  )),
                                ),
                                onTap: (){
                                  _validateUserAndLogin();
                                },
                              ),
                              SizedBox(height: maxHeight * 0.05,),
                              InkWell(
                                child: Container(
                                  width: size.width * 0.55,
                                  height: maxHeight * 0.07,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: const Border(
                                        top: BorderSide(
                                            color: Color(0xffED1C24)
                                        ),
                                        bottom: BorderSide(
                                            color: Color(0xffED1C24)
                                        ),
                                        right: BorderSide(
                                            color: Color(0xffED1C24)
                                        ),
                                        left: BorderSide(
                                            color: Color(0xffED1C24)
                                        )
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset("assets/images/google_icon.png"),
                                      const Text("Sign In With Google",
                                        style: TextStyle(
                                            color: Color(0xffED1C24)
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                                onTap: () async{
                                  _signInWithGoogle();
                                },
                              ),
                              SizedBox(height: maxHeight * 0.05,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () async{
                                      print("auth bio");
                                      await _authenticateWithBiometrics();
                                    },
                                    child: const Column(
                                      children: [
                                        Icon(Icons.fingerprint_rounded),
                                        Text("Finger login")
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: constraints.maxWidth * 0.05,),
                                  InkWell(
                                    onTap: _bioMetrics.contains(BiometricType.face) || _bioMetrics.contains(BiometricType.strong) || _bioMetrics.contains(BiometricType.weak) ? () async{
                                      await _authenticateWithBiometrics();
                                    } : null,
                                    child: Column(
                                      children: [
                                        Image.asset('assets/images/facelogin.png',height: 30,),
                                        const Text("Face login")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: maxHeight * 0.05,),
                              InkWell(child: const Text("Forget password?"),
                                onTap: (){
                                  Navigator.push(context, PageTransition(child: const ForgotPasswordScreen(), type: PageTransitionType.rightToLeft));

                                },
                              ),
                              SizedBox(height: maxHeight * 0.06,),
                              InkWell(child: const Text("Don't have an account? Register"),
                                onTap: (){
                                  Navigator.pushReplacement(context, PageTransition(child: const SignUpScreen(), type: PageTransitionType.rightToLeft));
                                },
                              ),
                            ],
                          ),
                        );
                      }
                  ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _validateUserAndLogin() async{
    FormState formState = _formKey.currentState!;
    if(formState.validate()){
      formState.save();
      try{
        if(_emailPhoneOrUser.contains(RegExp(r'^\+[1-9]{1}[0-9]{3,14}$'))){
          var response = await http.get(Uri.http("sc9.indus-erp.com:1251","/ords/fortline/reg/LoginAPI",{
            "mobile": _emailPhoneOrUser,
            "password": _password
          }));
          var res = jsonDecode(response.body);
          if(response.statusCode == 200 && res["items"].length > 0){
            MyConstants.setUsername = res["items"][0]["usrname"];
            MyConstants.setEmailId = res["items"][0]["insby"];
            Navigator.pushReplacement(context, PageTransition(child: OtpScreen(), type: PageTransitionType.rightToLeft));
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
          }
        }
        else{
          var response = await http.get(Uri.http("sc9.indus-erp.com:1251","/ords/fortline/reg/LoginAPI",{
            "insby": _emailPhoneOrUser,
            "password": _password
          }));
          var res = jsonDecode(response.body);
          if(response.statusCode == 200 && res["items"].length > 0){
            MyConstants.setUsername = res["items"][0]["usrname"];
            MyConstants.setEmailId = res["items"][0]["insby"];
            Navigator.pushReplacement(context, PageTransition(child: Home(), type: PageTransitionType.rightToLeft));
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
          }
        }
      }
      catch(e){
        print(e);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
      }
    }
  }
  Future<void> _signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      print("google user email: ${userCredential.user!.email}");
      MyConstants.setUsername = userCredential.user!.displayName!;
      Navigator.pushReplacement(context,
          PageTransition(child: Home(), type: PageTransitionType.rightToLeft));
    }
    catch(e){
      print("login error ${e}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed ${e}")));
    }
  }
  Future<void> _authenticateWithBiometrics() async{
    print("auth with bio");
    try{
      bool authenticated = await auth.authenticate(localizedReason: "Please carry on with Biometric Authentication",
      options: const AuthenticationOptions(
        stickyAuth: true,
      )
      );
      if(authenticated){
        Navigator.pushReplacement(context, PageTransition(child: Home(), type: PageTransitionType.rightToLeft));
      }
    }
    on PlatformException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }
}
