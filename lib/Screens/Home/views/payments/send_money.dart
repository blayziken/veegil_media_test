import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/utils/margins.dart';

class SendMoney extends StatefulWidget {
  static const routeName = '/send-money';

  const SendMoney({Key? key}) : super(key: key);

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  bool _spinner = false;
  // double _amount = 0.0;
  // String _bank = '';
  // int _accountNumber = 0;
  // String _note = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _accountNumberController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  //
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(child: Icon(Icons.arrow_back_ios), onTap: () => Navigator.pop(context)),
        title: Text(
          "Send Money",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Amount",
                    style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  yMargin5,
                  _buildAmountField(),
                  yMargin20,
                  Text(
                    "Bank",
                    style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  yMargin5,
                  _buildBankField(),
                  yMargin20,
                  Text(
                    "Account Number",
                    style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  yMargin5,
                  _buildAccountNumberField(),
                  yMargin20,
                  Text(
                    "Add a note (optional)",
                    style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w300),
                  ),
                  yMargin5,
                  _buildAddNoteField(),
                ],
              ),
            ),
            Spacer(),
            Expanded(
              flex: 0,
              child: Center(
                child: _spinner
                    ? CircularProgressIndicator(
                        color: Colors.green,
                      )
                    : InkWell(
                        child: Container(
                          height: 60,
                          width: media.width * 0.45,
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.8),
                                spreadRadius: 0.4,
                                blurRadius: 9,
                                offset: Offset(2, 2),
                              ),
                            ],
                          ),
                          child: Center(
                              child: Text(
                            'Send',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          )),
                        ),
                        onTap: () async {
                          setState(() {
                            _spinner = true;
                          });

                          print(_amountController.text);
                          print(_bankController.text);
                          print(_accountNumberController.text);
                          print(_noteController.text);

                          var _transaction = Transaction(
                            id: _accountNumberController.text,
                            type: 'Transfer',
                            phoneNumber: _accountNumberController.text,
                            amount: _amountController.text,
                            note: _noteController.text,
                          );

                          try {
                            Provider.of<Transactions>(context, listen: false).addTransaction(_transaction);
                            setState(() {
                              _spinner = false;
                            });
                            Navigator.pushReplacementNamed(context, '/success');
                          } catch (error) {
                            setState(() {
                              _spinner = false;
                            });
                            print(error);
                            // throw error;
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('An error occured!'),
                                content: Text('Something went wrong.'),
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
                          }
                        },
                      ),
              ),
            ),
            // yMargin30,
            Spacer(),
          ],
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    return Expanded(
      flex: 0,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: _amountController,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'N0.00',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Input an amount';
            }

            return null;
          },
          // onSaved: (value) {
          //   // _name = value!;
          // },
        ),
      ),
    );
  }

  Widget _buildBankField() {
    return Expanded(
      flex: 0,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: _bankController,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'Which Bank',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Input an amount';
            }

            return null;
          },
          // onSaved: (value) {
          //   // _name = value!;
          // },
        ),
      ),
    );
  }

  Widget _buildAccountNumberField() {
    return Expanded(
      flex: 0,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,

          controller: _accountNumberController,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: '0123456789',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Input an amount';
            }

            return null;
          },
          // onSaved: (value) {
          //   // _name = value!;
          // },
        ),
      ),
    );
  }

  Widget _buildAddNoteField() {
    return Expanded(
      flex: 0,
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: _noteController,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.0,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            hintText: 'What\'s this for?',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Input an amount';
            }

            return null;
          },
          // onSaved: (value) {
          //   // _name = value!;
          // },
        ),
      ),
    );
  }
}
