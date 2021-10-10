import 'package:flutter/material.dart';

import 'login.dart';

/// SIGN UP
class Signup extends StatefulWidget {
  static const routeName = '/sign-up';

  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String _phoneNumber = '';
  String _password = '';

  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

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
                  padding: const EdgeInsets.all(30),
                  icon: const Icon(
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
                        padding: const EdgeInsets.only(left: 30.0, top: 30.0),
                        child: RichText(
                          text: const TextSpan(
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
                      const Padding(
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
                const SizedBox(
                  height: 100.0,
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 30.0, bottom: 60.0, right: 60),
                      child: Form(
                        key: _formKey2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            _buildPhoneNumber(),
                            const SizedBox(height: 30),
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
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ),
                          onTap: () {
                            if (!_formKey2.currentState!.validate()) {
                              return;
                            }

                            _formKey2.currentState!.save();
                            Navigator.pushNamed(context, '/home');
                          },
                        ),
                      ),
                      Spacer(),
                      Center(
                        child: InkWell(
                          child: RichText(
                            text: const TextSpan(
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
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: const InputDecoration(
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
      decoration: const InputDecoration(
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

  // Widget _buildName() {
  //   return TextFormField(
  //     decoration: const InputDecoration(
  //       labelText: 'Full Name',
  //       labelStyle: TextStyle(
  //         color: Colors.black,
  //       ),
  //     ),
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return 'Name is required';
  //       }
  //
  //       return null;
  //     },
  //     onSaved: (value) {
  //       _email = value!;
  //     },
  //   );
  // }
  //
  // Widget _buildEmail() {
  //   return TextFormField(
  //     decoration: const InputDecoration(
  //       labelText: 'Email',
  //       labelStyle: TextStyle(
  //         color: Colors.black,
  //       ),
  //     ),
  //     keyboardType: TextInputType.emailAddress,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return 'Email is required';
  //       }
  //
  //       return null;
  //     },
  //     onSaved: (value) {
  //       _email = value!;
  //     },
  //   );
  // }
  //
  // Widget _buildUserName() {
  //   return TextFormField(
  //     decoration: const InputDecoration(
  //       labelText: 'Username',
  //       labelStyle: TextStyle(
  //         color: Colors.black,
  //       ),
  //     ),
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return 'Email is required';
  //       }
  //
  //       return null;
  //     },
  //     onSaved: (value) {
  //       _email = value!;
  //     },
  //   );
  // }
  //
  // Widget _buildPassword() {
  //   return TextFormField(
  //     decoration: const InputDecoration(
  //       labelText: 'Password',
  //       labelStyle: TextStyle(
  //         color: Colors.black,
  //       ),
  //     ),
  //     keyboardType: TextInputType.visiblePassword,
  //     validator: (value) {
  //       if (value!.isEmpty) {
  //         return 'Email is required';
  //       }
  //
  //       return null;
  //     },
  //     onSaved: (value) {
  //       _email = value!;
  //     },
  //   );
  // }

}
