import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stack_design/screens/User/LoginPage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
    // final TextEditingController _phoneNumber = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isLoading = false;

  // Function to handle password visibility toggle
  void _togglePasswordView(bool isPassword) {
    setState(() {
      if (isPassword) {
        _obscurePassword = !_obscurePassword;
      } else {
        _obscureConfirmPassword = !_obscureConfirmPassword;
      }
    });
  }

  // Function to handle user signup
  void _signup() async {
    if (_emailController.text.isEmpty || !_emailController.text.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid email address")));
      return;
    }

    if (_passwordController.text.trim() !=
        _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match")));
      return;
    }

    if (_passwordController.text.trim().length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password must be at least 6 characters")),
      );
      return;
    }

    try {
      setState(() {
        _isLoading = true;
      });

      // Create user with email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          );

      User? user = userCredential.user;

      if (user != null) {
        // Save user data to Firestore (without userType)
        FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'email': user.email,
          'name':_nameController.text.trim(),
          // 'phone': _phoneNumber.text.trim(),
        });

        // Navigate to login page after successful signup
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Signup failed: ${e.toString()}")));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.network(
              //   'https://www.shutterstock.com/image-vector/glassmorph-transparent-blank-login-sign-600nw-2277511117.jpg',
              // ),
              SizedBox(height: 220),
              Text(
                "Sign up",
                style: TextStyle(
                  color: const Color.fromARGB(255, 88, 84, 84),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
          
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter Name",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(223, 0, 0, 0),
                    fontSize: 18,
                  ),
                  suffixIcon: Icon(
                    Icons.person,
                    color: const Color.fromARGB(255, 88, 180, 229),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
          
              // Email TextField
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(223, 0, 0, 0),
                    fontSize: 18,
                  ),
                  suffixIcon: Icon(
                    Icons.email,
                    color: const Color.fromARGB(255, 240, 44, 44),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
          
              // Password TextField
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(223, 0, 0, 0),
                    fontSize: 18,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () => _togglePasswordView(true),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
          
              // Confirm Password TextField
              TextField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                    color: const Color.fromARGB(223, 0, 0, 0),
                    fontSize: 18,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () => _togglePasswordView(false),
                  ),
                ),
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 15),
          
              // Sign Up Button
              GestureDetector(
                onTap: () {
                  if (!_isLoading) {
                    setState(() {
                      _isLoading = true;
                    });
                    _signup();
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff6b63ff),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child:
                        _isLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
          
              // Redirect to Login if already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        ),
                    child: Text(
                      "LogIn",
                      style: TextStyle(
                        color: const Color.fromARGB(238, 91, 89, 89),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
