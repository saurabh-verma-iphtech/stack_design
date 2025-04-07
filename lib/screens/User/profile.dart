import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stack_design/screens/User/LoginPage.dart';
import 'package:stack_design/screens/User/profileEditPage.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String userName = "";
  String userEmail = "";
  String userNumber = "";
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _getUserDetails();
  }

  Future<void> _getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      var userDoc = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid);
      var docSnapshot = await userDoc.get();

      if (docSnapshot.exists) {
        setState(() {
          userName = docSnapshot['name'] ?? 'No Name';
          userEmail = docSnapshot['email'] ?? 'No Email';
          userNumber = docSnapshot['phoneNumber'] ?? 'No Number';
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        print("No data found for this seller.");
      }
    } else {
      setState(() {
        isLoading = false;
      });
      print("No user is logged in.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Dashboard"),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Text("LogOut", style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.account_circle, size: 50),
                    SizedBox(height: 20),
                    Text(
                      "Welcome, $userName!",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Email: $userEmail",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                            
                            Text(
                              "Phone: $userNumber",
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 10),
                           
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(),
                          ),
                        ).then((_) {
                          _getUserDetails(); // Refresh after edit
                        });
                      },
                      child: Text("Edit Details"),
                    ),
                  ],
                ),
              ),
    );
  }
}
