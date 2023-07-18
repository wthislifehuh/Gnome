import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/account/drawer.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/account/widget/text_box.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //all users
  final usersCollection = FirebaseFirestore.instance.collection("Users");

  //edit field
  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColors.lightBrown,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              title: Text(
                "Edit $field",
                style: const TextStyle(
                    color: AppColors.darkBrown,
                    fontFamily: 'Poppins',
                    fontSize: 20),
              ),
              content: TextField(
                autofocus: true,
                style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 16,
                  fontFamily: 'Poppins',
                ),
                decoration: InputDecoration(
                    hintText: "Enter new $field",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                    )),
                onChanged: (value) {
                  newValue = value;
                },
              ),
              actions: [
                // cancel button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                        color: AppColors.darkBrown,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                ),

                //save button
                TextButton(
                  onPressed: () => Navigator.of(context).pop(newValue),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                        color: AppColors.darkBrown,
                        fontFamily: 'Poppins',
                        fontSize: 16),
                  ),
                )
              ],
            ));

    //update in firestore
    if (newValue.isNotEmpty) {
      //only upadte if there is something in textfield
      await usersCollection.doc(currentUser.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerPage(),
        backgroundColor: AppColors.lightBr,
        appBar: AppBar(
          title: const Text('ℙ ℝ 𝕆 𝔽 𝕀 𝕃 𝔼'),
          backgroundColor: AppColors.darkBrown,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            //get user data
            if (snapshot.hasData) {
              final userData = snapshot.data!.data() as Map<String, dynamic>?;

              if (userData != null) {
                return ListView(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    //profile pic
                    SizedBox(
                      width: 200,
                      height: 200,
                      //padding: const EdgeInsets.only(right: 40, left: 40),
                      child: currentUser.photoURL != null
                          ? CircleAvatar(
                              backgroundColor: Colors.transparent,
                              child: SizedBox(
                                width: 180,
                                height: 180,
                                child: ClipOval(
                                  child: Image.network(
                                    currentUser.photoURL!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : const ClipOval(
                              child: Material(
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.person,
                                    size: 100,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    //user email
                    Text(
                      currentUser.email!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 14,
                          fontFamily: 'Poppins'),
                    ),

                    //user details
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 25),
                      child: Text(
                        "My Details",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontFamily: 'Poppins'),
                      ),
                    ),

                    //username
                    MyTextBox(
                      text: userData['username'],
                      sectionName: 'Username',
                      onPressed: () => editField('username'),
                    ),

                    //bio
                    MyTextBox(
                      text: userData['bio'],
                      sectionName: 'Bio',
                      onPressed: () => editField('bio'),
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 192, 182, 182),
                      thickness: 1,
                    ),
                    //user posts
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 25),
                      child: Text(
                        "My Posts",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 15,
                            fontFamily: 'Poppins'),
                      ),
                    ),
                    // TODO: POST
                  ],
                );
              } else {
                return const Center(
                  child: Text('User data not found.'),
                );
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error${snapshot.error}'),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
