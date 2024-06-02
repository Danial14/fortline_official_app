import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class ComplaintCard extends StatefulWidget {
  double? _width;
  late final double _height;
  late String? _ticketNo;
  late String? _refNo;
  late String? _status;
  late String? _complain;
  late int _cardIndex;
  ComplaintCard(double? width, double height, String? ticketNo, String? refNo, String? status, String? complain, int cardIndex){
    this._width = width;
    this._height = height;
    this._ticketNo = ticketNo;
    this._refNo = refNo != null ? refNo : "";
    this._status = status != null ? status : "";
    this._complain = complain;
    this._cardIndex = cardIndex;
  }
  @override
  State<ComplaintCard> createState() => _ComplaintCardState();
}

class _ComplaintCardState extends State<ComplaintCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: Container(
        width: widget._width != null ? widget._width : 0,
        height: widget._height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 4,
              offset: Offset(4, 8), // Shadow position
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(90),bottomLeft: Radius.circular(30), topLeft: Radius.circular(65)
                  ),
                      child: Container(
                        width: 23,
                        height: 23,
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Center(
                          child: Text(widget._cardIndex.toString(), style: TextStyle(color: Colors.white),),
                        ),
                      )
                  ),
            Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Container()),
                  Expanded(child: Text("TICKET", style: TextStyle(fontSize: 7))),
                  Expanded(child: Text(widget._ticketNo!, style: TextStyle(fontSize: 7))),
                  Expanded(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("STATUS:", style: TextStyle(fontSize: 7),),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                      Image.asset("assets/images/completed.png", width: 6, height: 6,),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                      Text("Completed", style: TextStyle(fontSize: 4))
                    ],
                  ),
                  //flex: 2,
                  ),
                  Expanded(child: Text("COMPLAINTS", style: TextStyle(fontSize: 7))),
                  Expanded(child: Text(widget._complain!, style: TextStyle(fontSize: 7)), flex: 2,),
                ],
              ),
             flex: 2,
            ),
            Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Expanded(child: Text("REFERENCE", style: TextStyle(fontSize: 7))),
                Expanded(child: Text(widget._refNo!, style: TextStyle(fontSize: 7))),
                badges.Badge(
                  position: badges.BadgePosition.bottomEnd(end: 6),
                  badgeContent: Image.asset("assets/images/right_arrow_button.png", width: 20, height: 20,),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: Colors.white
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(55),bottomLeft: Radius.circular(60), topLeft: Radius.circular(155)
                        ),
                        child: Container(
                          width: 65,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                        )
                    ),
                  ),
                ),
              ],
            ),
            flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
