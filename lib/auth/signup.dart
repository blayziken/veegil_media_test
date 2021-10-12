import 'package:flutter/material.dart';
import 'package:veegil_media_test/services/network_handler.dart';
import 'package:veegil_media_test/widgets/snack_bar.dart';

/// SIGN UP
class Signup extends StatefulWidget {
  static const routeName = '/sign-up';

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _spinner = false;

  // String _phoneNumber = '';
  // String _password = '';

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // API Network Handler Call
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
                padding: EdgeInsets.all(30),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.red,
                  size: 30.0,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                flex: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 30.0, top: 30.0),
                      child: RichText(
                        text: TextSpan(
                          text: 'Create An',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 37.0,
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
                      padding: EdgeInsets.only(left: 30.0, top: 15.0),
                      child: Text(
                        'And discover an amazing experience...',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 17.5,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Expanded(
                flex: 0,
                child: Padding(
                    padding: EdgeInsets.only(left: 30.0, bottom: 60.0, right: 60),
                    child: Form(
                      key: _formKey2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildPhoneNumber(),
                          SizedBox(height: 30),
                          _buildPassword(),
                        ],
                      ),
                    )),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: InkWell(
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: _spinner
                                ? CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                                  )
                                : Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                          ),
                        ),
                        onTap: () async {
                          setState(() {
                            _spinner = true;
                          });

                          if (!_formKey2.currentState!.validate()) {
                            return;
                          }

                          Map<String, String> body = {
                            "phoneNumber": _phoneNumberController.text,
                            "password": _passwordController.text,
                          };

                          // try {
                          //   var response = await networkHandler.post('auth/signup', body);
                          //
                          //   if (response.statusCode == 200 || response.statusCode == 201) {
                          //     setState(() {
                          //       _spinner = false;
                          //     });
                          //
                          //     Navigator.pushReplacementNamed(context, '/home');
                          //   } else {
                          //     setState(() {
                          //       _spinner = false;
                          //     });
                          //     customSnackBar(context, 'Error Signing up, try again...');
                          //     print(response.statusCode);
                          //   }
                          // } catch (error) {
                          //   setState(() {
                          //     _spinner = false;
                          //   });
                          //   throw (error);
                          // }

                          Navigator.pushReplacementNamed(context, '/home');
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
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Login',
                                style: TextStyle(
                                  color: Colors.red,
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
                    SizedBox(height: 30),
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
      // onSaved: (value) {
      //   _phoneNumber = value!;
      // },
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
      // onSaved: (value) {
      //   _password = value!;
      // },
    );
  }
}
