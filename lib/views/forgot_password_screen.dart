import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bottomclip.png'),
              alignment: Alignment.bottomLeft,
              fit: BoxFit.fitWidth
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.03,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset('assets/images/logo.png',height: 40,)
                  ),
                ),
               SizedBox(height: height * 0.1,),
               Text('Create a new Password',style: GoogleFonts.albertSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
               ),
              ),
              SizedBox(height: height * 0.01,),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffED1C24)),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                    hintText: 'New Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      focusedBorder:const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffED1C24)),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      hintText: 'Confirm Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      )
                  ),
                ),
              ),
              SizedBox(height: height * 0.06,),
              Container(
                height: height * 0.06,
                width: width * 0.6,
                decoration: BoxDecoration(
                  color: const Color(0xffED1C24),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Center(
                  child: Text('Done',style: GoogleFonts.albertSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                  ),),
                ),
              )
            ],
          ),
        ),

    );
  }
}
