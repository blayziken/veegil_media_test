import 'package:flutter/material.dart';
import 'package:veegil_media_test/services/network_handler.dart';

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
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  icon: Icon(Icons.arrow_back_ios, color: Colors.red, size: 30.0),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  flex: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 30.0, top: 10.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 37.0,
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
                        padding: EdgeInsets.only(left: 30.0, top: 5.0),
                        child: Text(
                          'We missed you.',
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
                SizedBox(height: 30.0),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30.0, bottom: 10.0, right: 60),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildPhoneNumber(),
                          SizedBox(height: 30),
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
                                  : Icon(Icons.arrow_forward, color: Colors.white, size: 30.0),
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

                            // try {
                            //   var response = await networkHandler.post('auth/login', body);
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
                            //     customSnackBar(context, 'Error Signing in, try again...');
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
                    ],
                  ),
                ),
                SizedBox(height: 30),
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
