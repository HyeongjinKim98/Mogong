import 'package:flutter/material.dart';
import 'post_study.dart';
import 'info.dart';
import 'main_study.dart';

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
  int index = 0;
  MyAccount account = MyAccount("김형진", "rlagudwls3469@gmail.com", "qwe123");
  final screens = [
    const Center(child : Text("home",style: TextStyle(fontSize: 72),)),
    const Center(child : Text("buy", style: TextStyle(fontSize: 72),)),
    const StudyMain(),
    const Center(child : Text("commu", style: TextStyle(fontSize: 72),)),
  ];
  @override
  Widget build(BuildContext context)=> Scaffold(
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
                              const Text(
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
                        const Text("공감", style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor:Colors.blue.shade100,
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 10, fontWeight: FontWeight.w500)
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:5),
          child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected:
              (index)=>setState(
                () => this.index = index),
            backgroundColor: Colors.white,
            height: 70,
            destinations: [
              NavigationDestination(
                icon: Image.asset('assets/home_icon.png', height: 22, width: 22),
                label: '홈'),
              NavigationDestination(
                icon: Image.asset('assets/perchase_icon.png', height: 22, width: 22),
                label: '공동구매'),
              NavigationDestination(
                icon: Image.asset('assets/study_icon.png', height: 22, width: 22),
                label: '스터디'),
              NavigationDestination(
                icon: Image.asset('assets/community_icon.png', height: 22, width: 22),
                label: '커뮤니티'),
            ]),
        ),
      ),
      floatingActionButton: Visibility(
        visible:false,
        child: FloatingActionButton(
            backgroundColor: const Color.fromRGBO(84, 41, 255, 1),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PostPage()));
            },
            child: Image.asset('assets/pencil.png', width: 24, height: 24)),
      ),
    );
  }



