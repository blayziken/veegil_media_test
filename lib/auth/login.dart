import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:veegil_media_test/model/transaction_provider.dart';
import 'package:veegil_media_test/services/network_handler.dart';
import 'package:veegil_media_test/widgets/snack_bar.dart';

class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _spinner = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: media.height,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  padding: EdgeInsets.only(
                      left: media.height * 0.020,
                      top: media.height * 0.020,
                      bottom: media.height * 0.010),
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.red, size: media.height * 0.030),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            left: media.height * 0.030,
                            top: media.height * 0.010),
                        child: RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: media.height * 0.057,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Back!',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: media.height * 0.030,
                            top: media.height * 0.005),
                        child: Text(
                          'We missed you.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                            fontSize: media.height * 0.027,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: media.height * 0.030),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: media.height * 0.030,
                        bottom: media.height * 0.010,
                        right: media.height * 0.060),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildPhoneNumber(),
                          SizedBox(height: media.height * 0.030),
                          _buildPassword(),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: InkWell(
                          child: Container(
                            height: media.height * 0.07,
                            width: media.height * 0.07,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(
                              child: _spinner
                                  ? CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.red),
                                    )
                                  : Icon(Icons.arrow_forward,
                                      color: Colors.white,
                                      size: media.height * 0.040),
                            ),
                          ),
                          onTap: () async {
                            setState(() {
                              _spinner = true;
                            });

                            if (!_formKey.currentState!.validate()) {
                              setState(() {
                                _spinner = false;
                              });
                              return;
                            }

                            Map<String, String> body = {
                              "phoneNumber": _phoneNumberController.text,
                              "password": _passwordController.text,
                            };

                            try {
                              var response =
                                  await networkHandler.post('auth/login', body);
                              if (response.statusCode == 200 ||
                                  response.statusCode == 201) {
                                setState(() {
                                  _spinner = false;
                                });

                                Provider.of<Transactions>(context,
                                        listen: false)
                                    .userPhoneNumber(
                                        _phoneNumberController.text);

                                Navigator.pushReplacementNamed(
                                    context, '/home');
                              } else {
                                setState(() {
                                  _spinner = false;
                                });
                                customSnackBar(
                                    context, 'Error Signing in, try again...');
                              }
                            } catch (error) {
                              setState(() {
                                _spinner = false;
                              });
                              customSnackBar(
                                  context, 'Error Signing in, try again...');
                              throw (error);
                            }

                            // Navigator.pushReplacementNamed(context, '/home');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.height * 0.030),
                // Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      controller: _phoneNumberController,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone number required';
        }
        return null;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      controller: _passwordController,
      decoration: InputDecoration(
        labelText: 'Password',
        labelStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
    );
  }
}
