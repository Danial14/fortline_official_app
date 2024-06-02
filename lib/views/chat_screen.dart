import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:official_fortline_app/views/my_invoices.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/support.dart';
import 'package:page_transition/page_transition.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/privacypolicy.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: height * 0.05,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Image.asset('assets/images/Fortline-logo-white.png',height: 25,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.notifications_none,color: Colors.white,size: 20,),
                        InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context, PageTransition(child: const UserProfile(),
                                  type: PageTransitionType.rightToLeft));
                            },
                            child: Image.asset('assets/images/user.png',height: 20,color: Colors.white,))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pushReplacement(context, PageTransition(child: const Support(),
                          type: PageTransitionType.leftToRight));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset('assets/images/back-button.png',height: 25,)
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.25,),
                  const Text('Ticket # FPL-120',style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  ),),
        
                ],
              ),
              SizedBox(height: height * 0.01,),
              Container(
                height: height * 0.73,
                width: width * 1,
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemCount: 8,
                    itemBuilder: (context,index){
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
        
                                ChatBubble(
                                    clipper: ChatBubbleClipper6(type: BubbleType.sendBubble),
                                    alignment: Alignment.topRight,
        
                                    margin: const EdgeInsets.only(top: 20),
                                    backGroundColor: const Color(0xffED1C24),
                                    child: Container(
        
                                      constraints: BoxConstraints(
                                        maxWidth: width * 0.5,
                                      ),
                                      child: const Text(
                                        "Lorem ipsum dolor sit.",
                                        style: TextStyle(color: Colors.white,),
                                      ),)
                                ),
                                const CircleAvatar(
                                  backgroundColor: Color(0xffED1C24),
        
                                ),
                              ],
                            ),
                          ),
        
        
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.grey,
        
                                ),
                                ChatBubble(
                                    clipper: ChatBubbleClipper6(type: BubbleType.receiverBubble),
                                    backGroundColor: const Color(0xffE7E7ED),
                                    margin: const EdgeInsets.only(top: 20),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxWidth: width * 0.5,
                                      ),
                                      child: const Text(
                                        "Ut enim ad minim venia elit.",
                                        style: TextStyle(color: Colors.black),
                                      ),)
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
              const Spacer(),
              Container(
                height: height * 0.09,
                width: width,
                decoration: const BoxDecoration(
                  color: Color(0xffED1C24),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        height: height * 0.06,
                        width: width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0),
                            color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14.0,right: 6.0),
                          child: TextField(
                            cursorColor: Colors.black,
        
                            decoration: InputDecoration(
        
                              border: InputBorder.none,
                              focusColor: Colors.white,
                              suffixIcon: InkWell(
                                onTap: (){
                                  print('send message');
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2),
                                  child: CircleAvatar(
                                      backgroundColor: Color(0xffED1C24),
                                      child: Icon(Icons.send,color: Colors.white,size: 20,)),
                                ),
                              ),
                              hintText: 'Type here Something .....',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02,),
                    InkWell(
                      onTap: (){
                        print('attach file');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('assets/images/attachfile.png',height: 20,),
                      ),
                    ),
                  ],
                ),
              ),
        
        
            ],
          ),
        ),
      ),



    );
  }
}
