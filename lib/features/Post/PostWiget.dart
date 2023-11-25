import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 550,
      color: Colors.white,
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
                          "assets/images/porifle Test.png",
                          fit: BoxFit.cover,
                        )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "memezar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
                ],
              ),
            ),
            ClipRect(
              child: Container(
                child: Image.asset(
                  "assets/images/Post image test.png",
                  fit: BoxFit.fitHeight,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
