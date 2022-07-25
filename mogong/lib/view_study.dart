import 'package:flutter/material.dart';
import 'info.dart';

class StudyView extends StatelessWidget {
  const StudyView({Key? key, required this.post}) : super(key: key);
  final StudyPost post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Container(
            padding: const EdgeInsets.only(left: 110),
            child: const Text(
              '스터디',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          )),
        body: Container(
          padding: EdgeInsets.fromLTRB(45, 30, 45, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Row(
                  children: [
                    Text(post.title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w800
                    ),),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('모집인원 ${post.currentmember}/${post.totalmember}'
                          ,style: const TextStyle(
                            fontSize: 11,
                            color: Colors.blue
                          ),),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height : 20
                ),
                Text(post.contents,
                style: const TextStyle(
                  fontSize: 13,
                ),)
            ],
          ),
        ),
    );
  }
}