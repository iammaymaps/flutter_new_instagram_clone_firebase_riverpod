import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
    required this.likePressed,
    required this.writeComments,
    required this.sharePressed,
    required this.viewAllComments,
    required this.profileImageName,
    required this.postImageName,
    required this.userName,
    required this.likes,
    required this.postTitel,
  }) : super(key: key);
  final VoidCallback likePressed;
  final VoidCallback writeComments;
  final VoidCallback sharePressed;
  final VoidCallback viewAllComments;
  final String profileImageName;
  final String postImageName;
  final String userName;
  final String likes;
  final String postTitel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: ClipOval(
                            child: Image.asset(
                          profileImageName,
                          fit: BoxFit.cover,
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        userName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert_outlined,
                          size: 25, color: Colors.white))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Image.asset(
              postImageName,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 350,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: likePressed,
                        icon: const Icon(Icons.favorite_border_rounded,
                            color: Colors.white)),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: writeComments,
                        icon: const Icon(Icons.chat_bubble_outline_rounded,
                            color: Colors.white)),
                    const SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: sharePressed,
                        icon: const Icon(Icons.send_rounded,
                            color: Colors.white)),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border_rounded,
                        color: Colors.white)),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    likes,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                alignment: Alignment.topLeft,
                child: Flexible(
                  child: ReadMoreText(
                    postTitel,
                    trimLines: 1,
                    style: TextStyle(color: Colors.white),
                    colorClickableText: Colors.pink,
                    trimMode: TrimMode.Line,
                    textAlign: TextAlign.left,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: '  Show less',
                    moreStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: viewAllComments,
              child: Row(
                children: [
                  Text(
                    "View all 2 comments",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "Octuber 10",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: Colors.grey),
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
