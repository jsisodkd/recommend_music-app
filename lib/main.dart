import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recommend_music/screen/ai_recommend.dart';
import 'package:recommend_music/screen/home_screen.dart';
import 'package:recommend_music/screen/loginpage.dart';
import 'package:recommend_music/screen/projectmusic.dart';
import 'package:recommend_music/screen/librarymusic.dart'; // 추가 화면
import 'package:recommend_music/screen/mypage.dart'; // 설정 화면

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // 현재 선택된 인덱스

  // 화면을 전환하는 메서드
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // 선택된 인덱스 업데이트
    });
  }

  // 현재 화면을 반환하는 메서드
  Widget _getCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen(); // 홈 화면
      case 1:
        return SearchMusic(); // 음악 검색 화면
      case 2:
        return AiRecommendMusic(); // AI 추천 화면
      case 3:
        return LibraryMusic(); // 라이브러리 화면
      case 4:
        return MyPage(); // 설정 화면
      default:
        return HomeScreen(); // 기본 화면
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xEA181818),
        body: _getCurrentScreen(), // 현재 화면 표시
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 0.6, // 경계선의 두께
              color: Colors.grey, // 경계선 색상
            ),
            BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex, // 현재 선택된 인덱스
              onTap: _onItemTapped, // 아이템 클릭 시 호출되는 메서드
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home, size: 20,), label: '홈'),
                BottomNavigationBarItem(icon: Icon(Icons.library_books_rounded, size: 20,), label: '프로젝트'),
                BottomNavigationBarItem(icon: Icon(Icons.graphic_eq, size: 20,), label: 'AI 추천'),
                BottomNavigationBarItem(icon: Icon(Icons.view_timeline, size: 20,), label: '라이브러리'),
                BottomNavigationBarItem(icon: Icon(Icons.settings, size: 20,), label: '설정'),
              ],
              backgroundColor: Color(0xFF000000),
              selectedItemColor: Color(0xF25511CB), // 선택된 아이템 색상
              unselectedItemColor: Colors.grey, // 선택되지 않은 아이템 색상
              selectedIconTheme: IconThemeData(size: 25), // 선택된 아이콘 테마
              unselectedIconTheme: IconThemeData(size: 23), // 선택되지 않은 아이콘 테마
            ),
          ],
        ),
      ),
    );
  }
}
