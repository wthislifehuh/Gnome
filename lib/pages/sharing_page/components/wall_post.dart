import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/pages/sharing_page/components/delete_button.dart';
import 'package:first_app/style/colours.dart';
import 'package:flutter/material.dart';
import 'package:first_app/pages/sharing_page/components/comment.dart';
import 'package:first_app/pages/sharing_page/components/like_button.dart';
import 'package:first_app/pages/sharing_page/datetime.dart';
import 'comment_button.dart';

class GnomePost extends StatefulWidget {
  final String message;
  final String user;
  final String time;
  final String postId;
  final List<String> likes;

  const GnomePost(
      {super.key,
      required this.user,
      required this.time,
      required this.message,
      required this.postId,
      required this.likes});

  @override
  State<GnomePost> createState() => _GnomePostState();
}

class _GnomePostState extends State<GnomePost> {
  //user
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;
  String? username;
  int? commentNum;

  //comment text controller
  final _commentTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isLiked = widget.likes.contains(currentUser.email);
    fetchUsername();
    commentCount();
  }

  void fetchUsername() async {
    final userSnapshot = await FirebaseFirestore.instance
        .collection('Users')
        .doc(widget
            .user) // Use the user email to fetch the corresponding username
        .get();

    final userData = userSnapshot.data();

    if (mounted) {
      setState(() {
        username = userData?['username'] as String?;
      });
    }
  }

  void commentCount() async {
    final commentSnapshot = await FirebaseFirestore.instance
        .collection('User Posts')
        .doc(widget.user)
        .collection('Comments')
        .where('PostId', isEqualTo: widget.postId)
        .get();

    if (mounted) {
      setState(() {
        commentNum = commentSnapshot.docs.length; // Get the number of documents
      });
    }
  }

  //toggle like
  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });

    //Access the document in firebase
    DocumentReference postRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      //if the post is now liked, add the users email to the liked field
      postRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      //if the post is unliked , remove the users email from liked field
      postRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  //add a comment
  void addComment(String commentText) {
    //write a comment to firestore under the comments collection of this post
    FirebaseFirestore.instance
        .collection("User Posts")
        .doc(widget.postId)
        .collection("Comments")
        .add({
      "CommentText": commentText,
      "CommentedBy": currentUser.email, //.displayName,
      "CommentTime": Timestamp.now(), //remember to format this when displaying
    });
  }

  //show a dialog box for adding comment
  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              title: const Text(
                "Add Comment",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                ),
              ),
              content: TextField(
                controller: _commentTextController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.edit),
                    hintText: "Write a comment...",
                    hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontFamily: 'Poppins')),
              ),
              actions: [
                //cancel button
                TextButton(
                  onPressed: () =>
                      {Navigator.pop(context), _commentTextController.clear()},
                  //clear controller

                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                        color: AppColors.darkBrown,
                        fontSize: 15,
                        fontFamily: 'Poppins'),
                  ),
                ),

                //post button
                TextButton(
                  onPressed: () => {
                    addComment(_commentTextController.text),
                    //pop box
                    Navigator.pop(context),

                    _commentTextController.clear(),
                  },
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        color: AppColors.darkBrown,
                        fontSize: 15,
                        fontFamily: 'Poppins'),
                  ),
                ),
              ],
            ));
  }

  // Delete Post Alert Dialog
  void deletePost() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        title: const Text(
          "Delete Post",
          style: TextStyle(
            color: AppColors.darkBrown,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        content: const Text(
          "Are you sure that you want to delete this post?",
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 16,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          //cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            //clear controller

            child: const Text(
              "Cancel",
              style: TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 15,
                  fontFamily: 'Poppins'),
            ),
          ),

          //post button
          TextButton(
            // Make sure that comments and post are deleted from the database
            onPressed: () async {
              final commentDocs = await FirebaseFirestore.instance
                  .collection("User Posts")
                  .doc(widget.postId)
                  .collection("Comments")
                  .get();

              for (var doc in commentDocs.docs) {
                await FirebaseFirestore.instance
                    .collection("User Posts")
                    .doc(widget.postId)
                    .collection("Comments")
                    .doc(doc.id)
                    .delete();
              }
              FirebaseFirestore.instance
                  .collection("User Posts")
                  .doc(widget.postId)
                  .delete()
                  .then((value) => print("Post Deleted"))
                  .catchError(
                      (error) => print("Failed to delete post: $error"));

              // Dismiss the dialog box
              Navigator.pop(context);
            },
            child: const Text(
              "Delete",
              style: TextStyle(
                  color: AppColors.darkBrown,
                  fontSize: 15,
                  fontFamily: 'Poppins'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.lightBrown, borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            width: 20,
          ),

          // Content
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // User Profile
                      SizedBox(
                        width: 50,
                        height: 50,
                        //padding: const EdgeInsets.only(right: 40, left: 40),
                        child: currentUser.photoURL != null
                            ? CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: ClipOval(
                                    child: Image.network(
                                      currentUser.photoURL!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    color: AppColors.lightBr,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Image.asset('images/GNOME_Logo.png',
                                    height: 60, width: 60),
                              ),
                      ),

                      const SizedBox(
                        width: 20,
                      ),
                      // User and Date
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username ?? widget.user,
                            style: const TextStyle(
                                color: AppColors.darkBrown,
                                fontSize: 14,
                                fontFamily: 'Poppins'),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            widget.time,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Delete button
                  if (widget.user == currentUser.email)
                    DeleteButton(onTap: deletePost),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // Message

              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(
                  widget.message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: AppColors.darkBrown,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontFamily: 'Poppins'),
                ),
              ),

              const SizedBox(
                height: 25,
              ),
              //buttons

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //LIKE
                  Column(
                    children: [
                      //like button
                      LikeButton(isLiked: isLiked, onTap: toggleLike),

                      const SizedBox(
                        height: 5,
                      ),

                      //like count

                      Text(widget.likes.length.toString(),
                          style: const TextStyle(color: AppColors.darkBrown)),
                    ],
                  ),

                  const SizedBox(
                    width: 10,
                  ),

                  //COMMENT
                  Column(
                    children: [
                      //comment button
                      CommentButton(onTap: showCommentDialog),

                      const SizedBox(
                        height: 5,
                      ),

                      //comment count

                      Text(
                        commentNum.toString(),
                        style: const TextStyle(color: AppColors.darkBrown),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),

              // Comments under the post
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("User Posts")
                      .doc(widget.postId)
                      .collection("Comments")
                      .orderBy("CommentTime", descending: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    //show loading circle if no data yet
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return ListView(
                      shrinkWrap: true, //for nested lists
                      physics: const NeverScrollableScrollPhysics(),
                      children: snapshot.data!.docs.map((doc) {
                        //get the comment
                        final commentData = doc.data() as Map<String, dynamic>;

                        //return the comment
                        return Comment(
                            text: commentData["CommentText"],
                            user: commentData["CommentedBy"],
                            time: formatDate(commentData["CommentTime"]));
                      }).toList(),
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
