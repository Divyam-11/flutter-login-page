import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> sendDataToServer(String username, String password) async {
    final url = 'http://localhost/insert_data.php';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'username': username,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      // Data stored successfully
      print('Data stored successfully');
    } else {
      // Failed to store data
      print('Failed to store data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Register',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20.0),
        TextFormField(
          controller: usernameController,
          style: TextStyle(
            color: Color(0xFFA29B9B),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300, // thinner font weight
          ),
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.person, color: Color(0xFFA29B9B)),
            hintText: 'Username',
            hintStyle: TextStyle(
              color: Color(0xFFA29B9B),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300, // thinner font weight
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEDEDED)),
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
        SizedBox(height: 10.0),
        TextFormField(
          controller: passwordController,
          style: TextStyle(
            color: Color(0xFFA29B9B),
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w300, // thinner font weight
          ),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock, color: Color(0xFFA29B9B)),
            hintText: 'Password',
            hintStyle: TextStyle(
              color: Color(0xFFA29B9B),
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w300, // thinner font weight
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFEDEDED)),
              borderRadius: BorderRadius.circular(40.0),
            ),
          ),
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            String username = usernameController.text.trim();
            String password = passwordController.text.trim();
            sendDataToServer(username, password);
          },
          child: Text('Submit',
              style: TextStyle(color: Colors.white, fontFamily: 'Roboto')),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFFE183F1)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(vertical: 15.0),
            ),
          ),
        ),
      ],
    );
  }
}
