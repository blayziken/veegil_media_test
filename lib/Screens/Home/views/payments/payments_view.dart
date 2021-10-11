import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:veegil_media_test/utils/margins.dart';

class PaymentsView extends StatelessWidget {
  const PaymentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payments",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        // color: Colors.teal,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 0,
                child: InkWell(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.8,
                          blurRadius: 4,
                          offset: Offset(3, 4),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.note_add_sharp, size: 35, color: Colors.purple),
                          xMargin10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Send Money",
                                style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              // yMargin5,
                              Text(
                                "Free transfers to all banks",
                                style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.purple, size: 20),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/send-money');
                  },
                ),
              ),
              yMargin20,
              Expanded(
                flex: 0,
                child: InkWell(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.8,
                          blurRadius: 4,
                          offset: Offset(3, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.note_add_sharp, size: 35, color: Colors.purple),
                          xMargin10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Buy Airtime",
                                style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              // yMargin5,
                              Text(
                                "Recharge any phone easily",
                                style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.purple, size: 20),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              yMargin20,
              Expanded(
                flex: 0,
                child: InkWell(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.8,
                          blurRadius: 4,
                          offset: Offset(3, 4),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.note_add_sharp, size: 35, color: Colors.purple),
                          xMargin10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Send Money",
                                style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              // yMargin5,
                              Text(
                                "Free transfers to all banks",
                                style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.purple, size: 20),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              yMargin20,
              Expanded(
                flex: 0,
                child: InkWell(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 0.8,
                          blurRadius: 4,
                          offset: Offset(3, 4),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(Icons.note_add_sharp, size: 35, color: Colors.purple),
                          xMargin10,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Buy Airtime",
                                style: TextStyle(color: Colors.purple, fontSize: 20, fontWeight: FontWeight.w900),
                              ),
                              // yMargin5,
                              Text(
                                "Recharge any phone easily",
                                style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(Icons.arrow_forward_ios_rounded, color: Colors.purple, size: 20),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ),
              yMargin20,
              // Padding(
              //   padding: EdgeInsets.all(20.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       Expanded(
              //         flex: 0,
              //         child: InkWell(
              //           child: Container(
              //             height: 120,
              //             color: Colors.black,
              //             child: Row(
              //               children: [
              //                 Icon(Icons.note_add_sharp),
              //                 xMargin10,
              //                 Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       "Send Money",
              //                       style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
              //                     ),
              //                     yMargin5,
              //                     Text(
              //                       "Free transfers to all banks",
              //                       style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
              //                     ),
              //                   ],
              //                 ),
              //                 Spacer(),
              //                 Icon(Icons.arrow_forward_ios_rounded),
              //               ],
              //             ),
              //           ),
              //           onTap: () {},
              //         ),
              //       ),
              //       yMargin20,
              //       Expanded(
              //         child: Container(
              //           height: 120,
              //           color: Colors.black,
              //           child: Row(
              //             children: [
              //               Icon(Icons.note_add_sharp),
              //               xMargin10,
              //               Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "Buy Airtime",
              //                     style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
              //                   ),
              //                   yMargin5,
              //                   Text(
              //                     "Recharge any phone easily",
              //                     style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w300),
              //                   ),
              //                 ],
              //               ),
              //               Spacer(),
              //               Icon(Icons.arrow_forward_ios_rounded),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
