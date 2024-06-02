import 'package:flutter/material.dart';
import 'package:official_fortline_app/views/new_login.dart';
import 'package:official_fortline_app/views/welcome_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController _smsCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomLeft,
                image: AssetImage("assets/images/otp_bg.png"),
                fit: BoxFit.fitWidth
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 5),
                  child: Image.asset("assets/images/fortline_logo.png",
                    width: size.width * 0.35,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: size.height * 0.25, left: size.width * 0.3),
                child: Text("Otp Verification", style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                ),),
                ),
                SizedBox(height: size.height * 0.05,),
                PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    controller: _smsCodeController,
                    enableActiveFill: true,
                    autoDisposeControllers: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      inactiveColor: Colors.grey.withOpacity(0.3),
                      selectedColor: Colors.grey.withOpacity(0.3),
                      selectedFillColor: Colors.grey.withOpacity(0.3),
                      activeFillColor: Colors.green.withOpacity(0.3),
                      inactiveFillColor: Color(0xffE6E6E6)
                    ),
                    length: 6,
                    appContext: context,
                  ),
                SizedBox(height: size.height * 0.08,),
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.25),
                  child: InkWell(
                    child: Container(
                      child: Center(child: Text("Verify", style: TextStyle(color: Colors.white),)),
                      width: size.width * 0.55,
                      height: size.height * 0.04,
                      decoration: BoxDecoration(
                          color: Color(0xffED1C24),
                          borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
                        return NewLogin();
                      }));
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
