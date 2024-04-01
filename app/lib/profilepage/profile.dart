import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../function/user_func.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserFunc loggedUser = UserFunc();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loggedUser = UserFunc.fromMap(value.data());
      setState(() {});
    });
  }

  verifymail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text("Verification Mail has been sent",
              style: TextStyle(fontSize: 18.0)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        //shadowColor: Colors.amber,
        title: (const Text("Profile")),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 250),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Name - ",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("${loggedUser.firstName} ${loggedUser.lastName}",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  const Divider(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Email -",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text("${loggedUser.email}",
                          style: const TextStyle(
                            fontSize: 20,
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 62,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      user!.emailVerified
                          ? const Text("Verified")
                          : TextButton(
                              onPressed: () {
                                verifymail();
                              },
                              child: const Text(
                                "Verify mail",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
