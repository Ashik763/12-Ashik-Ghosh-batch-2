import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _departmentController = TextEditingController();
  final TextEditingController _rollNumberController = TextEditingController();
  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _bloodGroupController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    final String firstName = _firstNameController.text;
    final String lastName = _lastNameController.text;
    final String phone = _phoneController.text;
    final String email = _emailController.text;
    final String department = _departmentController.text;
    final String rollNumber = _rollNumberController.text;
    final String registrationNumber = _registrationNumberController.text;
    final String gender = _genderController.text;
    final String bloodGroup = _bloodGroupController.text;
    final String password = _passwordController.text;

    if (firstName.isEmpty || lastName.isEmpty || phone.isEmpty || email.isEmpty || department.isEmpty || rollNumber.isEmpty || registrationNumber.isEmpty || gender.isEmpty || bloodGroup.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://bucse.vercel.app/register');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'email': email,
        'department': department,
        'rollNumber': rollNumber,
        'registrationNumber': registrationNumber,
        'gender': gender,
        'bloodGroup': bloodGroup,
        'password': password,
      }),
    );

    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      // Handle successful registration
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration successful')),
      );
      // Navigate to login page or another action
    } else {
      // Handle registration error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: ${response.body}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
              ),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
              ),
            ),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(
                labelText: 'Department',
              ),
            ),
            TextField(
              controller: _rollNumberController,
              decoration: InputDecoration(
                labelText: 'Roll Number',
              ),
            ),
            TextField(
              controller: _registrationNumberController,
              decoration: InputDecoration(
                labelText: 'Registration Number',
              ),
            ),
            TextField(
              controller: _genderController,
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
            ),
            TextField(
              controller: _bloodGroupController,
              decoration: InputDecoration(
                labelText: 'Blood Group',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _register,
                    child: Text('Register'),
                  ),
          ],
        ),
        ),
);
}
}