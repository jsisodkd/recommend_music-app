import 'package:flutter/material.dart';

class MusicRecommendationInput extends StatefulWidget {
  @override
  _MusicRecommendationInputState createState() => _MusicRecommendationInputState();
}

class _MusicRecommendationInputState extends State<MusicRecommendationInput> {
  final TextEditingController _controller = TextEditingController(); // 텍스트 입력을 위한 컨트롤러
  String _inputText = ''; // 입력된 텍스트 저장

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // 패딩 추가
      child: Column(
        children: [
          TextField(
            controller: _controller, // 컨트롤러 연결
            decoration: InputDecoration(
              labelText: '음악 추천을 위한 키워드 입력', // 인풋 박스 레이블
              border: OutlineInputBorder(), // 테두리 스타일
            ),
            onChanged: (value) {
              setState(() {
                _inputText = value; // 입력된 텍스트 업데이트
              });
            },
          ),
          SizedBox(height: 20), // 인풋 박스와 버튼 사이의 간격
          ElevatedButton(
            onPressed: () {
              // 추천 시스템 호출 (여기서 추천 로직을 추가)
              _recommendMusic(_inputText);
            },
            child: Text('추천 받기'), // 버튼 텍스트
          ),
        ],
      ),
    );
  }

  void _recommendMusic(String input) {
    // 여기에 추천 시스템 로직을 추가
    // 예: print('추천할 음악: $input');
    print('추천할 음악: $input'); // 현재는 입력된 텍스트를 출력
  }
}
