import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/services/network_handler.dart';
import 'package:veegil_media_test/widgets/show_dialog.dart';
import '../../../success.dart';

class SendMoney extends StatefulWidget {
  static const routeName = '/transfer-money';

  const SendMoney({Key? key}) : super(key: key);
  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  String error = "";
  bool _spinner = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _bankController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final TextEditingController _noteController = TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
            child: Icon(Icons.arrow_back_ios),
            onTap: () => Navigator.pop(context)),
        title: Text(
          "Transfer",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: media.height,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(media.height * 0.020),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 0,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Amount",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: media.height * 0.022,
                            fontWeight: FontWeight.w300),
                      ),
                      // yMargin5,
                      SizedBox(height: media.height * 0.005),
                      _buildAmountField(),
                      ErrorText(error: error),
                      SizedBox(height: media.height * 0.010),
                      Text(
                        "Bank",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: media.height * 0.022,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: media.height * 0.005),
                      _buildBankField(),
                      ErrorText(error: error),
                      SizedBox(height: media.height * 0.010),
                      Text(
                        "Account Number",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: media.height * 0.022,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: media.height * 0.005),
                      _buildAccountNumberField(),
                      ErrorText(
                          error:
                              error), // ErrorText(error: accountNumberError),
                      SizedBox(height: media.height * 0.010),
                      Text(
                        "Add a note (optional)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: media.height * 0.022,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: media.height * 0.005),
                      _buildAddNoteField(),
                    ],
                  ),
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
                            height: media.height * 0.060,
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
                                fontSize: media.height * 0.030,
                                color: Colors.white,
                              ),
                            )),
                          ),
                          onTap: () async {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            setState(() {
                              _spinner = true;
                            });

                            print(_amountController.text);
                            print(_bankController.text);
                            print(_accountNumberController.text);
                            print(_noteController.text);

                            // Check if there's enough balance to transfer out
                            final accountBalance = Provider.of<Transactions>(
                                    context,
                                    listen: false)
                                .accountBalance
                                .replaceAll(",", "");
                            if (int.parse(accountBalance) <
                                int.parse(_amountController.text)) {
                              setState(() {
                                _spinner = false;
                              });
                              return showDialogWidget(
                                  context, 'Insufficient Balance');
                            }

                            var _transaction = Transaction(
                              id: _accountNumberController.text,
                              type: 'Transfer',
                              phoneNumber: _accountNumberController.text,
                              amount: _amountController.text,
                              note: _noteController.text,
                            );

                            Map<String, String> body = {
                              "phoneNumber": _accountNumberController.text,
                              "amount": _amountController.text,
                            };

                            // try {
                            //   var response = await networkHandler.post('accounts/transfer', body);
                            //
                            //   if (response.statusCode == 200 || response.statusCode == 201) {
                            //     Provider.of<Transactions>(context, listen: false).addTransaction(_transaction);
                            //     Provider.of<Transactions>(context, listen: false).deductAccountBalance(int.parse(_amountController.text));
                            //
                            //     setState(() {
                            //       _spinner = false;
                            //     });
                            //
                            //     Navigator.pushReplacement(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => Success(
                            //           text: 'Transfer',
                            //         ),
                            //       ),
                            //     );
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

                            Provider.of<Transactions>(context, listen: false)
                                .addTransaction(_transaction);
                            Provider.of<Transactions>(context, listen: false)
                                .deductAccountBalance(
                                    int.parse(_amountController.text));

                            setState(() {
                              _spinner = false;
                            });

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Success(
                                  text: 'Transfer',
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ),
              SizedBox(height: media.height * 0.005),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountField() {
    Size media = MediaQuery.of(context).size;

    return Expanded(
      flex: 0,
      child: Container(
        height: media.height * 0.065,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          style: TextStyle(
            color: Colors.black,
            fontSize: media.height * 0.025,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: media.height * 0.022,
                vertical: media.height * 0.017),
            hintText: 'N0.00',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: media.height * 0.025,
              fontWeight: FontWeight.normal,
            ),
            errorStyle: TextStyle(
              fontSize: 0.0,
              height: 0.0,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              setState(() {
                error = 'Field cannot be empty';
              });
              return '';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildBankField() {
    Size media = MediaQuery.of(context).size;

    return Expanded(
      flex: 0,
      child: Container(
        height: media.height * 0.065,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: TextFormField(
            controller: _bankController,
            style: TextStyle(
              color: Colors.black,
              fontSize: media.height * 0.025,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: media.height * 0.022,
                  vertical: media.height * 0.017),
              hintText: 'Which Bank',
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
              ),
              errorStyle: TextStyle(
                fontSize: 0.0,
                height: 0.0,
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  error = 'Field cannot be empty';
                });
                return '';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAccountNumberField() {
    Size media = MediaQuery.of(context).size;

    return Expanded(
      flex: 0,
      child: Container(
        height: media.height * 0.065,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
          ],
          controller: _accountNumberController,
          style: TextStyle(
            color: Colors.black,
            fontSize: media.height * 0.025,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: media.height * 0.022,
                vertical: media.height * 0.017),
            hintText: '0123456789',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
            errorStyle: TextStyle(
              fontSize: 0,
              height: 0,
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              setState(() {
                error = 'Field cannot be empty';
              });
              return '';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildAddNoteField() {
    Size media = MediaQuery.of(context).size;

    return Expanded(
      flex: 0,
      child: Container(
        height: media.height * 0.065,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: _noteController,
          style: TextStyle(
            color: Colors.black,
            fontSize: media.height * 0.025,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: media.height * 0.022,
                vertical: media.height * 0.017),
            hintText: 'What\'s this for?',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 20.0,
              fontWeight: FontWeight.normal,
            ),
            errorStyle: TextStyle(
              fontSize: 0.0,
              height: 0.0,
            ),
          ),
        ),
      ),
    );
  }
}

class ErrorText extends StatelessWidget {
  const ErrorText({
    Key? key,
    required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Text(
      error,
      style: TextStyle(
          color: Colors.red,
          fontSize: media.height * 0.018,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300),
    );
  }
}
