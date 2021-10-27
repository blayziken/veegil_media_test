import 'package:flutter/material.dart';
import 'package:veegil_media_test/services/network_handler.dart';
import 'package:veegil_media_test/widgets/snack_bar.dart';

class Signup extends StatefulWidget {
  static const routeName = '/sign-up';

  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _spinner = false;

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  NetworkHandler networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: media.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IconButton(
                padding: EdgeInsets.only(
                    top: media.height * 0.030, left: media.height * 0.030),
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
                          top: media.height * 0.030),
                      child: RichText(
                        text: TextSpan(
                          text: 'Create An',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: media.height * 0.050,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' Account',
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
                          top: media.height * 0.010),
                      child: Text(
                        'And discover an amazing experience...',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                          fontSize: media.height * 0.02,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: media.height * 0.005),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: media.height * 0.030,
                      bottom: media.height * 0.010,
                      right: media.height * 0.060),
                  child: Form(
                    key: _formKey2,
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
              Expanded(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: InkWell(
                        child: Container(
                          height: media.height * 0.070,
                          width: media.height * 0.070,
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
                                : Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: media.height * 0.04,
                                  ),
                          ),
                        ),
                        onTap: () async {
                          setState(() {
                            _spinner = true;
                          });

                          if (!_formKey2.currentState!.validate()) {
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
                                await networkHandler.post('auth/signup', body);
                            print(response.body);
                            if (response.statusCode == 200 ||
                                response.statusCode == 201) {
                              setState(() {
                                _spinner = false;
                              });

                              Navigator.pushReplacementNamed(context, '/home');
                            } else {
                              setState(() {
                                _spinner = false;
                              });
                              customSnackBar(
                                  context, 'Error Signing up, try again...');
                            }
                          } catch (error) {
                            setState(() {
                              _spinner = false;
                            });
                            customSnackBar(
                                context, 'Error Signing in, try again...');
                            print(error);
                          }

                          // Navigator.pushReplacementNamed(context, '/home');
                        },
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: InkWell(
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account?',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.normal,
                              fontSize: media.height * 0.020,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Login',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/login');
                        },
                      ),
                    ),
                    SizedBox(height: media.height * 0.030),
                  ],
                ),
              )
            ],
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
