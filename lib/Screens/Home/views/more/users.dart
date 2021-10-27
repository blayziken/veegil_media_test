import 'package:flutter/material.dart';

class Users extends StatelessWidget {
  static const routeName = '/users';

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "More",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        // color: Colors.teal,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
              left: media.height * 0.020,
              right: media.height * 0.020,
              top: media.height * 0.040),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              UserTile(
                title: "Users 1",
                onTap: () => Navigator.pushNamed(context, '/users'),
              ),
              // yMargin30,
              SizedBox(height: media.height * 0.030),
              UserTile(
                title: "Users 1",
                onTap: () =>
                    Navigator.pushNamed(context, '/withdrawal-history'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const UserTile({
    required this.title,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Expanded(
      flex: 0,
      child: InkWell(
        child: Container(
          height: media.height * 0.070,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0.8,
                blurRadius: 4,
                offset: Offset(3, 4),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: media.height * 0.015),
            child: Row(
              children: [
                Icon(Icons.accessibility_outlined,
                    size: media.height * 0.035, color: Colors.purple),
                SizedBox(width: media.height * 0.015),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: media.height * 0.025,
                          fontWeight: FontWeight.w900),
                    ),
                    // yMargin5,
                    Text(
                      title,
                      style: TextStyle(
                          // color: Colors.purple,
                          fontSize: media.height * 0.018,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded,
                    color: Colors.purple, size: media.height * 0.025),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
