import 'package:flutter/material.dart';

import 'api/api-client.dart';

class AccScreen extends StatefulWidget {
  const AccScreen({Key key}) : super(key: key);

  @override
  _AccScreenState createState() => _AccScreenState();
}

class _AccScreenState extends State<AccScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
              top: 10,
              right: 20,
              child: InkWell(
                onTap: () {
                  ApiClient.auth.signOut();
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              )),
          Text('Acc screen '),
        ],
      ),
    );
  }
}
