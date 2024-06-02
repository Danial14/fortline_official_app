import 'package:flutter/material.dart';
import 'widgets/image_animation.dart';

class NewSplash extends StatelessWidget {
  const NewSplash({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xffED1C24)
        ),
        width: size.width,
        height: size.height,
        child: Stack(
          //clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Column(
              children: <Widget>[
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ImageAnimation("assets/images/lines.png", Offset(0,-2)),
                    ),
                    flex: 1
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: ImageAnimation("assets/images/lines_down.png", Offset(0,2)),
                    ),
                    flex: 1
                ),
              ],
            ),
            Container(
              width: size.width * 0.3,
              height: size.height * 0.3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
              ),
              child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Center(child: Image.asset("assets/images/fortline_logo.png",
                      width: constraints.maxWidth * 0.8,
                      height:  constraints.maxHeight * 0.8,
                    ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
