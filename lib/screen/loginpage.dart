import 'package:flutter/material.dart';
import 'package:recommend_music/screen/ai_profiletext.dart';
import 'package:recommend_music/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _AiRecommendState();
}

class _AiRecommendState extends State<LoginPage> {
  String usersname = ''; // 초기값 설정
  String password = ''; // 비밀번호 초기값
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = usersname; // 초기값을 텍스트 필드에 설정
  }

  void _updateUsername() {
    setState(() {
      usersname = _usernameController.text; // 텍스트 필드의 값을 usersname에 업데이트
    });
  }

  void _updatePassword() {
    setState(() {
      password = _passwordController.text; // 텍스트 필드의 값을 password에 업데이트
    });
  }

  bool _isPasswordValid(String password) {
    // 비밀번호 유효성 검사: 6자 이상, 영문자와 숫자 포함
    return password.length >= 6 && RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(password);
  }

  void _navigateToHome() {
    if (_isPasswordValid(password)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyApp()), // 홈 스크린으로 이동
      );
    } else {
      // 비밀번호가 유효하지 않을 경우 경고 메시지 표시
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('비밀번호는 6자 이상이어야 하며, 영문자와 숫자를 포함해야 합니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF181818),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Hello,',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 10),
                  AiProfileText(usersnamed: usersname), // 업데이트된 사용자 이름 사용
                ],
              ),
              const SizedBox(height: 50),
              TextField(
                controller: _usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF282828),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter your name',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onSubmitted: (value) {
                  _updateUsername(); // 텍스트 필드에서 입력 후 업데이트
                },
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true, // 비밀번호 입력 시 텍스트 숨기기
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFF282828),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Enter your password',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                onChanged: (value) {
                  _updatePassword(); // 텍스트 필드에서 입력할 때마다 업데이트
                },
              ),
              const SizedBox(height: 40),
              Center( // Center 위젯으로 버튼을 감싸기
                child: ElevatedButton(
                  onPressed: _navigateToHome, // 버튼 클릭 시 홈 스크린으로 이동
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF9D9999), // 버튼 색상
                    minimumSize: const Size(120, 50), // 버튼의 최소 크기 설정 (width: 200, height: 50)
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    '로그인',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}