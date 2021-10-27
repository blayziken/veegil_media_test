import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/Screens/success.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/utils/margins.dart';
import 'package:veegil_media_test/widgets/show_dialog.dart';

class Deposit extends StatefulWidget {
  static const routeName = '/deposit';

  const Deposit({Key? key}) : super(key: key);

  @override
  State<Deposit> createState() => _DepositState();
}

class _DepositState extends State<Deposit> {
  bool _spinner = false;
  String text = "";

  _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

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
          'Deposit',
          style: TextStyle(fontSize: media.height * 0.025),
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
                padding: EdgeInsets.only(
                    top: media.height * 0.015,
                    left: media.height * 0.025,
                    right: media.height * 0.025),
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
                                height: media.height * 0.045,
                                width: media.height * 0.045,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.purple,
                                ),
                                child: Center(
                                  child: Text(
                                    'N',
                                    style: TextStyle(
                                        fontSize: media.height * 0.027,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(width: media.height * 0.025),
                              // xMargin20,
                              Flexible(
                                child: Text(
                                  text,
                                  style: TextStyle(
                                      fontSize: media.height * 0.090,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: media.height * 0.035),
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
                        leftButtonFn: () {
                          print('left button clicked');
                          print(text);
                        },
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
                          height: media.height * 0.07,
                          width: media.width * 0.4,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'Deposit',
                              style: TextStyle(
                                  fontSize: media.height * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        onTap: () {
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
                                      height: media.height * 0.040,
                                      width: media.height * 0.070,
                                      child: Text(
                                        'Okay',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: media.height * 0.020,
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
                          Provider.of<Transactions>(context, listen: false)
                              .addAccountBalance(amount);

                          var _transaction = Transaction(
                            type: 'Deposit',
                            amount: amount.toString(),
                          );

                          try {
                            Provider.of<Transactions>(context, listen: false)
                                .addTransaction(_transaction);
                            setState(() {
                              _spinner = false;
                            });
                            // Navigator.pushReplacementNamed(context, '/success');
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Success(
                                  text: 'Deposit',
                                ),
                              ),
                            );
                          } catch (error) {
                            setState(() {
                              _spinner = false;
                            });
                            print(error);
                            showDialogWidget(context, 'Something went wrong.');
                          }
                        },
                      ),
                    ),
                    SizedBox(height: media.height * 0.015),
                    // yMargin15,
                    // Spacer(),
                  ],
                ),
              ),
      ),
    );
  }
}
