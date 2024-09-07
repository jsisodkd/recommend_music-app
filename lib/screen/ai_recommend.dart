import 'package:flutter/material.dart';

class AiRecommendMusic extends StatefulWidget {
  const AiRecommendMusic({super.key});

  @override
  _AiRecommendMusicState createState() => _AiRecommendMusicState();
}

class _AiRecommendMusicState extends State<AiRecommendMusic> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _recommendedSongs = []; // 추천 음악 목록

  void _addRecommendation(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _recommendedSongs.add(text); // 인풋 박스의 값을 목록에 추가
        _controller.clear(); // 인풋 박스 초기화
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Color(0xFF0000009C),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0), // 앱바 제목 왼쪽 패딩
          child: Text(
            'MelodyPick',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // 아이콘 사이 간격
            child: Icon(
              Icons.notifications_rounded,
              size: 26,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // 아이콘 사이 간격
            child: Icon(
              Icons.view_timeline,
              size: 26,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft, // 좌측 정렬
                child: Text(
                  '원하는 음악을 검색',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 330,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xFF141414), // 배경색 설정
                  borderRadius: BorderRadius.circular(15), // 모서리 둥글게
                ),
                child: TextField(
                  controller: _controller,
                  // TextEditingController 연결
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.white70),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: '예)  지금 너무 우울해. 신나는 음악을 추천해줘.',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
                  onSubmitted: _addRecommendation, // 완료 버튼 클릭 시 호출되는 메서드
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: double.infinity,
                height: 1, // 경계선 두께
                color: Colors.white54, // 경계선 색상
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '이전에 추천받은 목록',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Color(0xFF2C2B2B),
                            isScrollControlled: true,
                            builder: (context) {
                              return SafeArea(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: Icon(
                                          Icons.warning,
                                          color: Colors.white,
                                        ),
                                        title: Text(
                                          '추천받을 때 참고하세요!',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      ListTile(
                                        leading: Icon(
                                          Icons.radio_button_checked_sharp,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        title: Text(
                                          '지금 너무 우울해. 신나는 음악을 추천해줘.',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.radio_button_checked_sharp,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        title: Text(
                                          '새벽 감성에 맞는 음악을 추천해줘.',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.radio_button_checked_sharp,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        title: Text(
                                          '아침에 학교 가는 길에 어울리는 음악을 추천해줘.',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.radio_button_checked_sharp,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        title: Text(
                                          '저녁 시간에 듣기 좋은 노래는?',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      ListTile(
                                        leading: Icon(
                                          Icons.radio_button_checked_sharp,
                                          color: Colors.white,
                                          size: 10,
                                        ),
                                        title: Text(
                                          '운동을 하기 전에 듣기 좋은 노래',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(
                                              context); // BottomSheet 닫기
                                        },
                                        child: Text('닫기',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.arrow_circle_down_sharp,
                            size: 20, color: Colors.white70),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      '즐겨찾기',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 270, // 박스 목록의 높이 설정
                child: _recommendedSongs.isEmpty
                    ? Center(
                        child: Text(
                          '추천받은 목록이 없습니다.',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _recommendedSongs.length, // 목록 아이템 수
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 10), // 각 박스 사이 간격
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Color(0xFF141414), // 박스 배경색
                              borderRadius:
                                  BorderRadius.circular(10), // 모서리 둥글게
                            ),
                            child: Text(
                              _recommendedSongs[index], // 추천 음악 텍스트
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
