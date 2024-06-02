import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:badges/badges.dart' as badges;

class ProfilePicture extends StatefulWidget {
  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  File? _imageFile;
  @override
  Widget build(BuildContext context) {
    return badges.Badge(
          position: badges.BadgePosition.bottomEnd(end: 25),
          badgeContent: InkWell(
            onTap: () async{
              ImagePicker imagePicker = ImagePicker();
              final image = await imagePicker.pickImage(source: ImageSource.camera);
              _imageFile = File(image!.path);
              setState((){
              });
            },
            child: Image.asset("assets/images/camera.png",
                width: 25,
                height: 25
            ),
          ),
          child: ClipPath(
            clipper: HexagonalClipper(),
            child: Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: _imageFile == null ? AssetImage("assets/images/user_av.png") : FileImage(_imageFile!) as ImageProvider,
                    fit: _imageFile != null ? BoxFit.cover : BoxFit.none,
                  )
              ),
            ),
          ),
        );
  }
}
