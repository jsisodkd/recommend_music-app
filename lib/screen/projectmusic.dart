import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SearchMusic extends StatelessWidget {
  const SearchMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000),
      appBar: AppBar(
        backgroundColor: Color(0xFF0000009C),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
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
          Icon(
            Icons.notifications_rounded,
            size: 26,
            color: Colors.white,
          ),
          SizedBox(width: 16), // 아이콘 간격
          Icon(
            Icons.view_timeline,
            size: 26,
            color: Colors.white,
          ),
          SizedBox(width: 8), // 마지막 아이콘 간격
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildUploadContainer(context),
                SizedBox(height: 40),
                _buildDivider(),
                SizedBox(height: 30),
                _buildPreviousProjectsHeader(context),
                SizedBox(height: 10),
                _buildProjectList(),
                SizedBox(height: 50),
                _buildNewContainer('새로운 레이아웃 1'), // 추가된 레이아웃 1
                SizedBox(height: 20),
                _buildNewContainer('새로운 레이아웃 2'), // 추가된 레이아웃 2
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadContainer(BuildContext context) {
    return Container(
      width: 340,
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xFF141414),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                _showImagePicker(context);
              },
              child: Text(
                '영상 또는 사진 업로드',
                style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1,
      color: Colors.white54,
    );
  }

  Widget _buildPreviousProjectsHeader(BuildContext context) {
    return Row(
      children: [
        Text(
          '이전 프로젝트 목록',
          style: TextStyle(color: Colors.white70, fontSize: 17, fontWeight: FontWeight.w700),
        ),
        SizedBox(width: 122),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              backgroundColor: Color(0xFF2C2B2B),
              isScrollControlled: true,
              builder: (context) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.contact_support_outlined,
                            color: Colors.white,
                          ),
                          title: Text(
                            '프로젝트 내 음악 추천이란?',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        _buildInfoList(),
                        SizedBox(height: 20),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('닫기', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Text('더 알아보기', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildProjectList() {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Color(0xFF1F1F1F),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '프로젝트 ${index + 1}',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildInfoList() {
    List<String> infoList = [      '영상 편집을 대상으로 서비스를 제공합니다.',      '영상 또는 사진을 통해 추천을 받습니다.',      '영상의 분위기 또는 장르를 분석해 추천을 받습니다.',      '추천받은 음악을 바탕으로 편집에 도움을 줄 수 있습니다.'    ];

    return Column(
      children: infoList.map((info) {
        return ListTile(
          leading: Icon(
            Icons.bolt_outlined,
            color: Colors.white,
            size: 20,
          ),
          title: Text(
            info,
            style: TextStyle(color: Colors.white70, fontSize: 15, fontWeight: FontWeight.w700),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNewContainer(String title) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: Color(0xFF141414),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  void _showImagePicker(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('파일 선택됨: ${pickedFile.path}')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('파일 선택이 취소되었습니다.')),
      );
    }
  }
}
