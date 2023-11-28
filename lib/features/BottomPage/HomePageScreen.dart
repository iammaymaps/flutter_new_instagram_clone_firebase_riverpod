import 'package:flutter/material.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/Post/PostWiget.dart';
import 'package:flutter_new_instagram_clone_firebase_riverpod/features/auth/domain/authController.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageScreen extends ConsumerStatefulWidget {
  HomePageScreen({super.key});

  @override
  ConsumerState<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends ConsumerState<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 80.0, // Set the desired height
          backgroundColor: Colors.black,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_border_rounded,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send_rounded,
                ),
              ),
            ),
          ],
          title: SvgPicture.network(
            "https://www.vectorlogo.zone/logos/instagram/instagram-wordmark.svg",
            color: Colors.white,
            height: 45,
            width: 45,
          )),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment
                          .topRight, // Adjust the gradient direction as needed
                      end: Alignment
                          .bottomLeft, // Adjust the gradient direction as needed
                      colors: [
                        Color(0xFFf9ce34),
                        Color(0xFFee2a7b),
                        Color(0xFF6228d7),
                      ],
                    ),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 90, // Adjust the size as needed
                      height: 90, // Adjust the size as needed
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: CircleAvatar(
                            radius: double.infinity,
                            child: ClipOval(
                              child: Image.asset(
                                "assets/images/ProfilePcture2.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PostWidget(
              likePressed: () {},
              writeComments: () {},
              sharePressed: () {},
              viewAllComments: () {},
              profileImageName: "assets/images/ProfilePcture1.png",
              postImageName: "assets/images/Post image 4.png",
              userName: "iamsiam",
              likes: "158",
              postTitel:
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
          PostWidget(
              likePressed: () {},
              writeComments: () {},
              sharePressed: () {},
              viewAllComments: () {},
              profileImageName: "assets/images/ProfilePcture2.png",
              postImageName: "assets/images/Post image 2.png",
              userName: "iamsiam",
              likes: "158",
              postTitel:
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
          PostWidget(
              likePressed: () {},
              writeComments: () {},
              sharePressed: () {},
              viewAllComments: () {},
              profileImageName: "assets/images/ProfilePcture3.png",
              postImageName: "assets/images/Post image 3.png",
              userName: "iamsiam",
              likes: "158",
              postTitel:
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
          PostWidget(
              likePressed: () {},
              writeComments: () {},
              sharePressed: () {},
              viewAllComments: () {},
              profileImageName: "assets/images/ProfilePcture3.png",
              postImageName: "assets/images/Post image 1.png",
              userName: "iamsiam",
              likes: "158",
              postTitel:
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
          PostWidget(
              likePressed: () {},
              writeComments: () {},
              sharePressed: () {},
              viewAllComments: () {},
              profileImageName: "assets/images/ProfilePcture3.png",
              postImageName: "assets/images/Post image 1.png",
              userName: "iamsiam",
              likes: "158",
              postTitel:
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
          PostWidget(
              likePressed: () {},
              writeComments: () {},
              sharePressed: () {},
              viewAllComments: () {},
              profileImageName: "assets/images/ProfilePcture3.png",
              postImageName: "assets/images/Post image 1.png",
              userName: "iamsiam",
              likes: "158",
              postTitel:
                  'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.'),
        ]),
      ),
    );
  }
}
