import 'package:flutter/material.dart';
import 'package:video_sharing/otp.dart' as first;

class MobileNumberInputPage extends StatefulWidget {
  const MobileNumberInputPage({super.key});

  @override
  State<MobileNumberInputPage> createState() => _MobileNumberInputPageState();
}

class _MobileNumberInputPageState extends State<MobileNumberInputPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _mobileNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a mobile number';
                  } else if (value.length != 10) {
                    return 'Please enter a 10-digit mobile number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _mobileNumber = value.toString();
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                child: const Text('Next'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Do something with the mobile number
                    print('Mobile Number: $_mobileNumber');
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => first.OTPPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
