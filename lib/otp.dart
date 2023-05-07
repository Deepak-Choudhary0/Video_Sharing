import 'package:flutter/material.dart';
import 'package:video_sharing/home.dart' as first;

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  String _otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter OTP',
              ),
              onChanged: (value) {
                setState(() {
                  _otp = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'Resend OTP',
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    // Resend OTP logic
                  },
                ),
                SizedBox(width: 16.0),
                ElevatedButton(
                  child: Text('Get Started'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => first.HomePage(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  width: 16.0,
                  height: 20,
                ),
                ElevatedButton(
                  child: Text('Go Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Go Back'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
