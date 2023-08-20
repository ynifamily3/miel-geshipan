import 'package:board/prefs/user.dart';
import 'package:board/screens/login.dart';
import 'package:flutter/material.dart';

class BoardList extends StatelessWidget {
  const BoardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade700,
        title: const Text('모두의 게시판'),
        leading: const IconButton(
            onPressed: null, tooltip: '메뉴', icon: Icon(Icons.menu)),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const Text("게시판 내용"),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              logoutUser();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginWidget(),
                ),
              );
            },
            child: const Text('로그아웃'),
          )
        ]),
      ),
    );
  }
}
