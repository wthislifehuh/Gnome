import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/account/drawer.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
//import 'package:first_app/pages/sharing_page/components/drawer.dart';
import 'package:first_app/pages/sharing_page/components/text_field.dart';
import 'package:first_app/pages/sharing_page/components/wall_post.dart';
import 'package:first_app/pages/sharing_page/datetime.dart';
//import 'package:first_app/pages/account/profile_page.dart';

class SharingPage extends StatefulWidget {
  const SharingPage({super.key});

  @override
  State<SharingPage> createState() => _SharingPageState();
}

class _SharingPageState extends State<SharingPage> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;

  //text controller
  final textController = TextEditingController();

  //post message
  void postMessage() {
    //only post if there is something in textfield
    if (textController.text.isNotEmpty) {
      //store in firebase
      FirebaseFirestore.instance.collection("User Posts").add({
        'UserEmail': currentUser.email,
        'Message': textController.text,
        'TimeStamp': Timestamp.now(),
        'Likes': [],
      });
    }

    //clear the text field
    setState(() {
      textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBr,
      appBar: AppBar(
        title: const Text('𝔾 ℕ 𝕆 𝕄 𝔼   ℍ 𝕌 𝔹'),
        backgroundColor: const Color(0xff433831),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const DrawerPage(),
      body: Center(
        child: Column(
          children: [
            //the wall
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("User Posts")
                    .orderBy("TimeStamp", descending: false)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        //get the message
                        final post = snapshot.data!.docs[index];
                        return GnomePost(
                          user: post['UserEmail'],
                          message: post['Message'],
                          postId: post.id,
                          likes: List<String>.from(post['Likes'] ?? []),
                          time: formatDate(post['TimeStamp']),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error : ${snapshot.error}'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),

            //post message
            Padding(
              padding: const EdgeInsets.only(
                  top: 15, left: 20, right: 10, bottom: 10),
              child: Row(
                children: [
                  //textfield
                  Expanded(
                    child: MyTextField(
                      controller: textController,
                      hintText: "Share your ideas on  𝔾 ℕ 𝕆 𝕄 𝔼...",
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  //post button
                  IconButton(
                      onPressed: postMessage,
                      icon: const Icon(
                        Icons.arrow_circle_up_sharp,
                        size: 35,
                        color: AppColors.darkBrown,
                      ))
                ],
              ),
            ),

            //logged in as
            Text(
              "Logged in as: ${currentUser.email!}",
              style: const TextStyle(
                  color: AppColors.darkBrown,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
