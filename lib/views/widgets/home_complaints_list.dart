import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:official_fortline_app/view_models/complaints_view_model.dart';
import 'package:official_fortline_app/views/support.dart';
import 'package:official_fortline_app/views/widgets/complaint_card.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../models/complaints_model.dart';
import '../constants/constants.dart';

class HomeComplaintsList extends StatefulWidget {
  const HomeComplaintsList({Key? key}) : super(key: key);

  @override
  State<HomeComplaintsList> createState() => _HomeComplaintsListState();
}

class _HomeComplaintsListState extends State<HomeComplaintsList> {
  Future<ComplaintsModel>? _complaintsModel;
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration.zero, (){
      _complaintsModel = Provider.of<ComplaintsViewModel>(context, listen: false).fetchAllComplaints(MyConstants.getEmailId!);
      setState(() {

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<ComplaintsModel>(future: _complaintsModel, builder: (ctx, snapshot){
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
        return Container(
            width: size.width,
            height: size.height * 0.15,
            child: ListView.builder(itemBuilder: (ctx, position){
              print("compData : ${complaintsData.items![1].prncplrefno}");
              return InkWell(child: ComplaintCard(size.width * 0.47, 0, complaintsData.items![position].tktnoC, complaintsData.items![position].prncplrefno, complaintsData.items![position].tktstsid, complaintsData.items![position].tktremarks, position),
                onTap: (){
                  Navigator.pushReplacement(context, PageTransition(child: const Support(), type: PageTransitionType.rightToLeft));

                },
              );
            },
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
            )
        );
      }
    });
  }
}
