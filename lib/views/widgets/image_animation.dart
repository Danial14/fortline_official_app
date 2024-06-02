import 'package:flutter/material.dart';
import 'package:official_fortline_app/views/new_login.dart';

import '../welcome_screen.dart';

class ImageAnimation extends StatefulWidget {
  late String _assetName;
  late Offset _startPosition;
  ImageAnimation(String assetName, Offset startPosition){
    this._assetName = assetName;
    this._startPosition = startPosition;
  }

  @override
  State<ImageAnimation> createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation> with TickerProviderStateMixin {
 late final AnimationController _animationController;
 late final Animation<Offset> _animation;
  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 3))..repeat(reverse: true);
    _animation = Tween<Offset>(
        begin: widget._startPosition,
        end: Offset(0, 0)
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.decelerate));
    _animationController.addStatusListener((status) {
      if(status.name == "reverse"){
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
          return WelcomeScreen();
        }));
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SlideTransition(position: _animation,
    child: Image.asset(widget._assetName,
    fit: BoxFit.fitWidth,
      width: MediaQuery.of(context).size.width,
    ),
    );
  }
 @override
 void dispose() {
   _animationController.dispose();
   super.dispose();
 }
}
