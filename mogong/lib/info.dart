class StudyPost {
  int index;
  int posttime;
  String posterid;
  String title;
  String contents;
  int totalmember;
  int currentmember;

  StudyPost(this.index, this.posttime, this.posterid, this.title, this.contents,
      this.totalmember, this.currentmember);
}

class MyAccount {
  String name;
  String email;
  String pw;
  MyAccount(this.name, this.email, this.pw);
}

var posts = [
  StudyPost(0, 3, '김형진', 'Flutter 공부', 'Flutter 스터디 모집합니다!\n많이 지원해주세요', 8, 1),
  StudyPost(1, 5, '김형진', '모집', '스터디 할사람', 8, 1),
  StudyPost(2, 7, '김형진', '제목3', '내용1', 8, 3),
  StudyPost(3, 8, '김형진', '제목4', '내용1', 8, 4),
  StudyPost(4, 17, '김형진', '제목5', '내용1', 8, 0),
  StudyPost(5, 29, '김형진', '제목6', '내용1', 8, 0),
  StudyPost(6, 34, '김형진', '제목7', '내용1', 8, 0),
  StudyPost(7, 44, '김형진', '제목8', '내용1', 8, 0),
  StudyPost(8, 59, '김형진', '제목9', '내용1', 8, 0),
];
