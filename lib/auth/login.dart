import 'package:flutter/material.dart';

/// LOGIN
class Login extends StatefulWidget {
  static const routeName = '/login';

  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _phoneNumber = '';
  String _password = '';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  padding: EdgeInsets.all(20),
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
                        padding: EdgeInsets.only(left: 30.0, top: 15.0),
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
                SizedBox(
                  height: 100.0,
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                      padding: EdgeInsets.only(left: 30.0, bottom: 60.0, right: 60),
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
                      )),
                ),
                // Spacer(),
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
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                          ),
                          onTap: () {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            _formKey.currentState!.save();
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 30),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
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
      onSaved: (value) {
        _phoneNumber = value!;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
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
      onSaved: (value) {
        _password = value!;
      },
    );
  }
}
