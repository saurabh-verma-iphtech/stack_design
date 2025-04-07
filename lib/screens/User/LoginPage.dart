import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stack_design/main.dart';
import 'package:stack_design/screens/User/SignupPage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false; // State for loading indicator

  // Function to handle user login
  void _login() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    // Check if email is valid
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid email address")));
      return;
    }

    try {
      // Sign in the user with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      User? user = userCredential.user;
      if (user != null) {
        // Show login confirmation message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Login Successful!"),
            backgroundColor: Colors.green,
          ),
        );
        // Wait for 1 second before navigating
        await Future.delayed(Duration(seconds: 1));

        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => MyHomePage()),
          );
        }
      }
    } catch (e) {
      // Show error message in case of failure
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login failed: ${e.toString()}")));
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator after login attempt
      });
    }
  }

  // Password visibility toggle
  bool _obscurePassword = true;

  void _togglePasswordView() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(
            //   'https://www.shutterstock.com/image-vector/glassmorph-transparent-blank-login-sign-600nw-2277511117.jpg',
            // ),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome!",
                    style: TextStyle(
                      color: const Color.fromARGB(223, 94, 92, 92),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Log In",
                    style: TextStyle(
                      color: const Color.fromARGB(228, 0, 0, 0),
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40),

                  // Email TextField
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(223, 0, 0, 0),
                      ),
                      suffixIcon: Icon(
                        Icons.email,
                        color: const Color.fromARGB(255, 88, 180, 229),
                      ),
                    ),
                    style: TextStyle(color: Colors.black, fontSize: 25),
                  ),
                  SizedBox(height: 30),

                  // Password TextField
                  TextField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(223, 0, 0, 0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        onPressed: _togglePasswordView,
                      ),
                    ),
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(height: 60),

                  // Buttons (Sign Up & Log In)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:
                            () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Signup()),
                            ),
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Color(0xff6b63ff),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!_isLoading) {
                            setState(() {
                              _isLoading = true;
                            });
                            _login();
                          }
                        },
                        child: Container(
                          width: 140,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xff6b63ff),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child:
                                _isLoading
                                    ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    : Text(
                                      "Log In",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
