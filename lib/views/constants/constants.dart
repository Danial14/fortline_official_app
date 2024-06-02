import 'dart:ui';

class MyConstants{
  static String? _userName;
  static String? _emailId;
  static final List<Map<String, String>> BOTTOM_NAVIGATION_ITEMS = const [
    {"name" : "Home", "icon" : "assets/images/home.png"},
    {"name" : "Invoices", "icon" : "assets/images/invoices.png"},
    //{"name" : "Store", "icon" : "assets/images/store.png"},
    {"name" : "Promotions", "icon" : "assets/images/promotions.png"},
    {"name" : "Team", "icon" : "assets/images/link.png"},
    {"name" : "Support", "icon" : "assets/images/support-services.png"},
    {"name" : "File", "icon" : "assets/images/pdf-file.png"},
  ];
  static final Color INPUT_BOX_RED_COLOR = Color(0xffEA1E23);
  static final Color FORTLINE_GREY = Color(0xffEDEDED);
  static final Color TAB_GREY = Color(0xffF0F5F9);
  static final List<String> brandImages = [
    "assets/images/fortinet.png",
    "assets/images/hp.png",
    "assets/images/lenovo.png",
    "assets/images/dell.png"
  ];
  static set setUsername(String? name){
    _userName = name;
  }
  static String? get getUsername{
    return _userName;
  }
  static set setEmailId(String? emailId){
    _emailId = emailId;
  }
  static String? get getEmailId{
    return _emailId;
  }
}