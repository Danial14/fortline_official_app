import 'package:flutter/material.dart';
import 'package:official_fortline_app/views/constants/constants.dart';

class InvoiceCard extends StatefulWidget {
  late Map<String, List<Map<String, String>>>? _invoice;
  InvoiceCard(Map<String, List<Map<String, String>>>? invoice){
    this._invoice = invoice;
  }

  @override
  State<InvoiceCard> createState() => _InvoiceCardState();
}

class _InvoiceCardState extends State<InvoiceCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        color: Color(0xffFBFBFB),
        child: Row(
          children: [
            Expanded(child: Container(
              //padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: MyConstants.INPUT_BOX_RED_COLOR,
                borderRadius: BorderRadius.only(topRight: Radius.circular(145), bottomRight: Radius.circular(20))
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 130,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                        child: Text("Date: 01-30-24",
                        style: TextStyle(
                          color: Colors.white
                        ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(child: Text("Test Invoice", style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),)),
                    Expanded(child: Text("Invoice Amount: PKR 5,000", style: TextStyle(color: Colors.white),)),
                    Expanded(child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Redeem By:", style: TextStyle(color: Colors.white),),
                        SizedBox(width: 6,),
                        Container(
                          width: 80,
                          height: 20,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text("Bank", style: TextStyle(
                            color: MyConstants.INPUT_BOX_RED_COLOR
                          ),),
                        )
                      ],
                    ),
                    flex: 2,)
                  ],
                ),
              ),
            ),
            flex: 3,
            ),
            Expanded(child: Container(
              decoration: BoxDecoration(
                color: Color(0xffFBFBFB)
              ),
              padding: EdgeInsets.only(top: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyConstants.INPUT_BOX_RED_COLOR
                    ),
                    child: Text("INV-10", style: TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Expanded(child: Text("Rebate: PKR 3,000",)),
                  Expanded(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Status:"),
                      SizedBox(width: 6,),
                      Container(
                        width: 70,
                        height: 20,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: widget._invoice!.keys.toList()[0] == "PAID" ? Colors.green : MyConstants.INPUT_BOX_RED_COLOR,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text(widget._invoice!.keys.toList()[0] == "PAID" ? "Paid" : "Unpaid", style: TextStyle(
                            color: Colors.white
                        ),),
                      )
                    ],
                  ),
                    ),

                  /*Expanded(child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Download\nInvoice"),
                      SizedBox(width: 6,),
                      Image.asset("assets/images/pdf.png", width: 50, height: 25,)
                    ],
                  ), flex: 2,)*/
                  Expanded(flex: 2,child: widget._invoice!.keys.toList()[0] == "UNPAID" ? Text("Remaining amount: 45") : Container())
                ],
              ),
            ),
            flex: 2,
            ),
          ],
        ),
      ),
    );
  }
}
