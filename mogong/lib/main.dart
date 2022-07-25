import 'package:flutter/material.dart';
import 'post_study.dart';
import 'view_study.dart';
import 'info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'sans'),
      home : const StudyPage()
    );
  }
}

class StudyPage extends StatefulWidget {
  const StudyPage({Key? key}) : super(key: key);

  @override
  State<StudyPage> createState() => _StudyPageState();
}

class _StudyPageState extends State<StudyPage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    MyAccount account = MyAccount("김형진", "rlagudwls3469@gmail.com", "qwe123");
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Row(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(5, 0, 14, 0),
                child: Image.asset(
                  'assets/mogong_logo.png',
                  width: 91,
                  height: 20,
                ),
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(12, 0, 3, 0),
                  alignment: Alignment.centerLeft,
                  height: 27,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: Color.fromRGBO(84, 41, 255, 1),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                    child: const TextField(
                        style: TextStyle(color: Colors.white, fontSize: 11),
                        decoration: InputDecoration(
                            hintText: 'commit test검색어를 입력하세요',
                            border: InputBorder.none,
                            hintStyle: TextStyle(color: Colors.white))),
                  ))
            ],
          )),
      endDrawer: Drawer(
          child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(
              height: 260,
              child: DrawerHeader(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: Divider.createBorderSide(context,
                            color: Colors.white))),
                child: Column(children: [
                  const SizedBox(
                    height: 50,
                    width: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Image.asset(
                      'assets/account_default.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                  Text(
                    account.name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(account.email,
                        style: const TextStyle(
                            fontSize: 15,
                            fontFamily: 'sans',
                            fontWeight: FontWeight.w100)),
                  )
                ]),
              ),
            ),
            Container(
              // color : Color.fromARGB(255, 246, 238, 238),
              color: Color.fromARGB(255, 234, 234, 234),
              child: SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        splashColor: Colors.blue,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/heart.png',
                                width: 24,
                                height: 24,
                              ),
                              Text(
                                "찜목록",
                                style: TextStyle(fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                        onTap: () => {print("찜 목록 클릭")}),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/zzim.png',
                          width: 24,
                          height: 24,
                        ),
                        Text("공감", style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      body: Container(
          padding: EdgeInsets.only(top: 10),
          color: Color.fromARGB(255, 239, 239, 239),
          child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, i) => SizedBox(
                    height: 140,
                    child: Card(
                        shadowColor: Colors.transparent,
                        elevation: 6,
                        margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                        child: ListTile(
                          onTap: () async{
                            final post = posts[i];
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context)=>new StudyView(post: post)
                              )
                            );
                          },
                          // (() {
                          //   print(posts[i].title);
                          //   Navigator.push(
                          //       context,
                          //          MaterialPageRoute(
                          //           builder: (context) => new StudyView())
                          //   );
                          // }),
                          title: Padding(
                            padding: const EdgeInsets.fromLTRB(11, 15, 0, 0),
                            child: Text(
                              posts[i].title,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.fromLTRB(11, 53, 0, 0),
                            child: Text(posts[i].contents),
                          ),
                          trailing: Text(
                            '모집인원 ${posts[i].currentmember}/${posts[i].totalmember}',
                            style: const TextStyle(
                              fontSize: 10,),                          
                          ),
                        )),
                  ))),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
        },
        items: [
          BottomNavigationBarItem(
              icon: Image.asset('assets/home_icon.png', height: 22, width: 22),
              label: '홈'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/perchase_icon.png', height: 22, width: 22),
              label: '공동구매',
              ),
          BottomNavigationBarItem(
              icon: Image.asset('assets/study_icon.png', height: 22, width: 22),
              label: '스터디'),
          BottomNavigationBarItem(
              icon: Image.asset('assets/community_icon.png', height: 22, width: 22),
              label: '커뮤니티'),
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.all(4.0),
      //   child: NavigationBar(
      //     height: 60,
      //     backgroundColor: Colors.white,
      //     destinations: [
      //       NavigationDestination(
      //           icon: Image.asset('assets/home_icon.png',
      //               height: 22, width: 22),
      //           label: '홈'),
      //       NavigationDestination(
      //           icon: Image.asset(
      //             'assets/perchase_icon.png',
      //             height: 22,
      //             width: 22,
      //           ),
      //           label: '공동구매'),
      //       NavigationDestination(

      //           icon: Image.asset('assets/study_icon.png',
      //               height: 22, width: 22),
      //           label: '스터디'),
      //       NavigationDestination(
      //         icon: Image.asset('assets/community_icon.png',
      //             height: 22, width: 22),
      //         label: '커뮤니티',
      //       ),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(84, 41, 255, 1),
          onPressed: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new PostPage()));
          },
          child: Image.asset('assets/pencil.png', width: 24, height: 24)),
    );
  }
}


