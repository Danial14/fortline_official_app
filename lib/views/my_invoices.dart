import 'package:flutter/material.dart';
import 'package:official_fortline_app/view_models/my_invoices_view_model.dart';
import 'package:official_fortline_app/views/profile.dart';
import 'package:official_fortline_app/views/widgets/invoices_card.dart';
import 'package:official_fortline_app/views/widgets/bottom_navigation_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'constants/constants.dart';
import 'package:official_fortline_app/utils/utils.dart';

class MyInvoices extends StatefulWidget {
  const MyInvoices({Key? key}) : super(key: key);

  @override
  State<MyInvoices> createState() => _MyInvoicesState();
}

class _MyInvoicesState extends State<MyInvoices> {
  List<ValueNotifier<bool>> _valueNotifiers = [ValueNotifier<bool>(true), ValueNotifier<bool>(false)];
  bool _firsttimeDownload = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget("Invoices"),
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
                SizedBox(height: size.height * 0.04,),
          Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/fortline_logo_white.png",
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                    const Icon(Icons.notifications_none, size: 20, color: Colors.white,),
                    InkWell(
                        onTap: (){
                          Navigator.pushReplacement(context, PageTransition(child: const UserProfile(), type: PageTransitionType.rightToLeft));
                        },
                        child: Image.asset("assets/images/user.png", height: 20, color: Colors.white,)),
                  ],
                ),
              ),
              ],
          ),
        ),
                const Align(
                  alignment: Alignment.topCenter,child: Text("MY INVOICES",
                  style: TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                  ),
                ),),

           SizedBox(height: size.height * 0.02,),
                Container(
                  width: size.width,
                  height: 70,
                  alignment: Alignment.center,
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyConstants.INPUT_BOX_RED_COLOR
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _changeTab(0);
                              },
                              child: ValueListenableBuilder(valueListenable: _valueNotifiers[0], builder: (ctx, val, ch){
                                if(val){
                                  return Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: MyConstants.TAB_GREY,
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Text("Paid",
                                    style: TextStyle(
                                      color: MyConstants.INPUT_BOX_RED_COLOR
                                    ),),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: const Text("Paid",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                );

                              }),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                _changeTab(1);
                              },
                              child: ValueListenableBuilder(valueListenable: _valueNotifiers[1], builder: (ctx, val, ch){
                                if(val){
                                  return Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: MyConstants.TAB_GREY,
                                      borderRadius: BorderRadius.circular(25)
                                    ),
                                    child: Text("Unpaid",
                                      style: TextStyle(
                                          color: MyConstants.INPUT_BOX_RED_COLOR
                                      ),),
                                  );
                                }
                                return Container(
                                  alignment: Alignment.center,
                                  height: 30,
                                  child: const Text("Unpaid",
                                    style: TextStyle(
                                        color: Colors.white
                                    ),),
                                );
                              }),
                            ),
                          ),
                        ]
                      ),
                    )
                  ),
                ),
                Expanded(flex: 4,
                child: FutureBuilder<Map<String, List<Map<String, String>>>>(
                  future: Provider.of<MyInvoicesViewModel>(context, listen: false).fetchInitialPaidInvoices(),
                  builder: (ctx, snapshot){
                    if(snapshot.hasData){
                      return Consumer<MyInvoicesViewModel>(builder: (ctx, invoiceviewModel, ch){
                        if(_firsttimeDownload){
                         // _firsttimeDownload = false;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: Image.asset(snapshot.data!.keys.toList()[0] == "PAID" ? "assets/images/paid_head.png" : "assets/images/unpaid_head.png", width: 100, height: 50,),
                            ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.6,
                                child: ListView.builder(itemBuilder: (ctx, position){
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
                                      child: InvoiceCard(snapshot.data!),
                                    );
                                  },
                                  itemCount: snapshot.data![snapshot.data!.keys.toList()[0]]!.length,
                                  ),
                              ),
                            ],
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Image.asset(invoiceviewModel.getCurrentTabbedInvoice.keys.toList()[0] == "PAID" ? "assets/images/paid_head.png" : "assets/images/unpaid_head.png", width: 100, height: 50,),
                          ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: ListView.builder(itemBuilder: (ctx, position){
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 8.0, right: 8, top: 4),
                                      child: InvoiceCard(invoiceviewModel.getCurrentTabbedInvoice),
                                    );
                                  },
                                  itemCount: invoiceviewModel.getCurrentTabbedInvoice[invoiceviewModel.getCurrentTabbedInvoice.keys.toList()[0]]!.length,
                                  ),
                            ),
                          ],
                        );
                      });
                    }
                    return Center(child: CircularProgressIndicator(),);
                  },
                )
                )
              ]
    )
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    //Utils.hideStatusbar();
    super.initState();
  }
  void _changeTab(int index) {
    _firsttimeDownload = false;
    print("onTap: ${index}");
    _valueNotifiers.forEach((element) {
      if(element.value){
        element.value = !element.value;
      }
    });
    _valueNotifiers[index].value = !_valueNotifiers[index].value;
    if(index == 0){
      Provider.of<MyInvoicesViewModel>(context, listen: false).fetchPaidInvoices();
    }
    else {
      Provider.of<MyInvoicesViewModel>(context, listen: false)
          .fetchUnpaidInvoices();
    }
  }
}
