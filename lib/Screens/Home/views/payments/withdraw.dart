import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/Screens/success.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/services/network_handler.dart';
import 'package:veegil_media_test/utils/margins.dart';
import 'package:veegil_media_test/widgets/show_dialog.dart';

class Withdraw extends StatefulWidget {
  static const routeName = '/withdraw';

  const Withdraw({Key? key}) : super(key: key);

  @override
  State<Withdraw> createState() => _WithdrawState();
}

class _WithdrawState extends State<Withdraw> {
  bool _spinner = false;
  String text = "";

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  NetworkHandler networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios),
          onTap: () => Navigator.pop(context),
        ),
        title: Text(
          'Withdraw',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        height: media.height,
        width: double.infinity,
        child: _spinner
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : Padding(
                padding: EdgeInsets.only(top: 15, left: 25.0, right: 25.0),
                child: Column(
                  children: [
                    Expanded(
                      flex: 0,
                      child: Container(
                        height: media.height * 0.16, // 200,
                        // color: Colors.black,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.purple,
                                ),
                                child: Center(
                                  child: Text(
                                    'N',
                                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: Colors.white),
                                  ),
                                ),
                              ),
                              xMargin20,
                              Flexible(
                                child: Text(
                                  text,
                                  style: TextStyle(fontSize: 80, fontWeight: FontWeight.w900, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    yMargin25,
                    Expanded(
                      flex: 3,
                      child: NumericKeyboard(
                        onKeyboardTap: _onKeyboardTap,
                        textColor: Colors.black,
                        rightButtonFn: () {
                          setState(() {
                            text = text.substring(0, text.length - 1);
                          });
                        },
                        rightIcon: Icon(
                          Icons.backspace_rounded,
                          color: Colors.black,
                        ),
                        // leftButtonFn: () {
                        //   print('left button clicked');
                        //   print(text);
                        // },
                        // leftIcon: Icon(
                        //   Icons.check,
                        //   color: Colors.black,
                        // ),
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      ),
                    ),
                    Spacer(),
                    Expanded(
                      flex: 0,
                      child: InkWell(
                        child: Container(
                          height: media.height * 0.058,
                          width: media.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'Withdraw',
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: () async {
                          setState(() {
                            _spinner = true;
                          });

                          if (text == '') {
                            setState(() {
                              _spinner = false;
                            });
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('An error occured!'),
                                content: Text('Please enter an amount'),
                                actions: <Widget>[
                                  InkWell(
                                    child: Container(
                                      height: 30,
                                      width: 60,
                                      child: Text(
                                        'Okay',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ),
                            );
                            return;
                          }
                          final amount = int.parse(text);

                          // Check if there's enough balance to transfer out
                          final accountBalance = Provider.of<Transactions>(context, listen: false).accountBalance.replaceAll(",", "");
                          if (int.parse(accountBalance) < int.parse(text)) {
                            setState(() {
                              _spinner = false;
                            });
                            return showDialogWidget(context, 'Insufficient Balance');
                          }

                          Map<String, String> body = {
                            "phoneNumber": '09028373021',
                            "amount": text,
                          };

                          // try {
                          //   var response = await networkHandler.post('accounts/withdraw', body);
                          //
                          //   if (response.statusCode == 200 || response.statusCode == 201) {
                          //     Provider.of<Transactions>(context, listen: false).deductAccountBalance(amount);
                          //
                          //     var _transaction = Transaction(
                          //       type: 'Withdraw',
                          //       amount: amount.toString(),
                          //     );
                          //
                          //     Provider.of<Transactions>(context, listen: false).addTransaction(_transaction);
                          //     setState(() {
                          //       _spinner = false;
                          //     });
                          //
                          //     Navigator.pushReplacement(
                          //       context,
                          //       MaterialPageRoute(builder: (context) => Success(text: 'Withdraw')),
                          //     );
                          //
                          //   } else {
                          //     setState(() {
                          //       _spinner = false;
                          //     });
                          //     customSnackBar(context, 'Server error, try again...');
                          //     print(response.statusCode);
                          //   }
                          //
                          // } catch (error) {
                          //   setState(() {
                          //     _spinner = false;
                          //   });
                          //   throw error;
                          // }

                          Provider.of<Transactions>(context, listen: false).deductAccountBalance(amount);

                          var _transaction = Transaction(
                            type: 'Withdraw',
                            amount: amount.toString(),
                          );

                          Provider.of<Transactions>(context, listen: false).addTransaction(_transaction);
                          setState(() {
                            _spinner = false;
                          });

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => Success(text: 'Withdraw')),
                          );
                        },
                      ),
                    ),
                    yMargin15,
                    // Spacer(),
                  ],
                ),
              ),
      ),
    );
  }
}
