import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:official_fortline_app/view_models/complaints_view_model.dart';
import 'package:official_fortline_app/view_models/consultant_viewmodel.dart';
import 'package:official_fortline_app/view_models/my_invoices_view_model.dart';
import 'package:official_fortline_app/view_models/products_view_model.dart';
import 'package:official_fortline_app/view_models/promo_viewmodel.dart';
import 'package:official_fortline_app/views/edit_user_profile.dart';
import 'package:official_fortline_app/views/home.dart';
import 'package:official_fortline_app/views/my_invoices.dart';
import 'package:official_fortline_app/views/new_login.dart';
import 'package:official_fortline_app/views/otp.dart';
import 'package:official_fortline_app/views/new_splash.dart';
import 'package:official_fortline_app/views/products.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/support.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     statusBarColor: Color(0xffED1C24)
   ));
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx){
        return MyInvoicesViewModel();
      }),
        ChangeNotifierProvider(create: (ctx){
          return ProductsViewModel();
        }),
        ChangeNotifierProvider(create: (ctx){
          return ComplaintsViewModel();
        }),
        ChangeNotifierProvider(create: (ctx){
          return PromoViewModel();
        }),
        ChangeNotifierProvider(create: (ctx){
          return ConsultantViewModel();
        })
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        home: NewLogin(),
      ),
    );
  }
}
