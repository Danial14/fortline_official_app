import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:official_fortline_app/utils/utils.dart';
import 'package:official_fortline_app/view_models/complaints_view_model.dart';
import 'package:official_fortline_app/views/chat_screen.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/promo_screen.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:official_fortline_app/views/widgets/complaint_card.dart';
import 'package:badges/badges.dart' as badges;
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../models/complaints_model.dart';
import 'constants/constants.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  String _message = "";
  String _referenceNo = "";
  String _yourSubject = "";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isFirsttime = true;
  Future<ComplaintsModel>? _complaintsModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget("Support"),
      floatingActionButton: InkWell(
        child: Container(width: 110, height: 25, decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
              color: Color(0xffEA1E23)
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/complaint_icon.png", width: 20, height: 20,),
                const Text("Complaint", style: TextStyle(color: Colors.white),)
              ],
            ),
          ),
        onTap: () async{

          await showDialog<void>(
            //barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            contentPadding: EdgeInsets.zero,
          content: Stack(
          clipBehavior: Clip.none,
          children: <Widget>[
          Positioned(
          right: -10,
          top: -17,
          child: InkWell(
          onTap: () {
            print("close tapped!");
          Navigator.of(context).pop();
          },
          child: const CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.close, color: Colors.white,),
          ),
          ),
          ),
            Container(
              width: size.width,
              height: size.height * 0.5,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/modal_bg.png"),
                      fit: BoxFit.fill
                  ),
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15))
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.02,),
                    Text("COMPLAINT FORM",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),),
                    SizedBox(height: size.height * 0.04,),
                    Row(
                      children: <Widget>[
                        Expanded(child: Container(
                          padding: EdgeInsets.only(left: 15, top: 15, bottom: 15),
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                              color: MyConstants.INPUT_BOX_RED_COLOR,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 12.0),
                                hintText: "Reference#",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.white
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.white,
                                )
                            ),
                            validator: (val){
                              if(val!.isEmpty){
                                return "Please input valid reference no";
                              }
                              return null;
                            },
                            onSaved: (val){
                              _referenceNo = val!;
                            },
                          ),
                        )),
                        const SizedBox(width: 5,),
                        Expanded(child: Container(
                          padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                          height: size.height * 0.07,
                          decoration: BoxDecoration(
                              color: MyConstants.INPUT_BOX_RED_COLOR,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 12.0),
                                hintText: "Type Your Subject",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.white
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.white,
                                )
                            ),
                            validator: (val){
                              if(val!.isEmpty){
                                return "Please input valid subject";
                              }
                              return null;
                            },
                            onSaved: (val){
                              _yourSubject = val!;
                            },
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      padding: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
                      width: size.width,
                      height: 150,
                      decoration: BoxDecoration(color: MyConstants.INPUT_BOX_RED_COLOR,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message",
                            hintStyle: TextStyle(
                                color: Colors.white
                            ),
                            errorStyle: TextStyle(
                              color: Colors.white,
                            )
                        ),
                        validator: (val){
                          if(val!.isEmpty){
                            return "Please input valid message";
                          }
                          return null;
                        },
                        onSaved: (val){
                          _message = val!;
                        },
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          _validateComplaint();
                        },
                        child: Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black
                          ),
                          child: const Center(
                            child: Text("Submit", style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
          ),
          ));
        },
      ),
      body: Container(
            width: size.width,
            height: size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/complaint.png"),
                fit: BoxFit.fill
              )
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 43),
              child: Row(
                children: [
                  Image.asset("assets/images/fortline_logo_white.png",
                    height: 25,
                  ),
                  SizedBox(width: size.width * 0.6,),
                  const Icon(Icons.notifications_none, size: 20, color: Colors.white,),
                  InkWell(
                      onTap: (){
                        Navigator.pushReplacement(context, PageTransition(child: const UserProfile(),
                            type: PageTransitionType.rightToLeft));
                      },
                      child: Image.asset("assets/images/user.png", height: 20, color: Colors.white,)),
                ],
              ),
                      ),
                       const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Align(alignment: Alignment.topCenter,child: Text("SUPPORT",
                        style: TextStyle(color: Colors.white,
                        fontSize: 16,
                          fontWeight: FontWeight.w600
                        ),
                        ),),
                      ),

                  const SizedBox(height: 15,),
                  Expanded(
                    child: FutureBuilder<ComplaintsModel>(future: _complaintsModel, builder: (ctx, snapshot){
                      if(snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData){
                        return Center(
                          child: SpinKitFadingCircle(
                            size: 40,
                            color: MyConstants.INPUT_BOX_RED_COLOR,
                          ),
                        );
                      }
                      else{
                        var complaintsData = snapshot.data!;
                        return Consumer<ComplaintsViewModel>(
                          builder: (context, complaints, ch) {
                            if(_isFirsttime){
                              _isFirsttime = false;
                              return Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.6
                                  ),itemBuilder: (ctx, position){
                                  return InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(context, PageTransition(child: const ChatScreen(), type: PageTransitionType.rightToLeft));

                                    },
                                    child: Padding(padding: const EdgeInsets.only(left: 7, top: 16),
                                      child: ComplaintCard(null, 0, complaintsData.items![position].tktnoC, complaintsData.items![position].prncplrefno, complaintsData.items![position].tktstsid, complaintsData.items![position].tktremarks, position),
                                    ),
                                  );
                                },
                                  itemCount: complaintsData.items!.length,
                                ),
                              );
                            }
                            else{
                              var complaintsData = complaints.getProducts;
                              return Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.6
                                  ),itemBuilder: (ctx, position){
                                  return InkWell(
                                    onTap: (){
                                      Navigator.pushReplacement(context, PageTransition(child: const ChatScreen(), type: PageTransitionType.rightToLeft));

                                    },
                                    child: Padding(padding: const EdgeInsets.only(left: 7, top: 16),
                                      child: ComplaintCard(null, 0, complaintsData.items![position].tktnoC, complaintsData.items![position].prncplrefno, complaintsData.items![position].tktstsid, complaintsData.items![position].tktremarks, position),
                                    ),
                                  );
                                },
                                  itemCount: complaintsData.items!.length,
                                ),
                              );
                            }
                          }
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
                  ),
          ]
          )
          ),
        );
  }
  @override
  void initState() {
    Future.delayed(Duration.zero, () async{
      _complaintsModel = Provider.of<ComplaintsViewModel>(context, listen: false).fetchAllComplaints(MyConstants.getEmailId!);
      setState(() {

      });
    });
    super.initState();
  }
  Future<bool> _resolveData() async{
    return true;
  }
  void _validateComplaint(){
    FormState? formState = _formKey.currentState!;
    if(formState.validate()){
      formState.save();
    }
  }
}
