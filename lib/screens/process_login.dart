import 'package:board/models/UserModel.dart';
import 'package:board/prefs/user.dart';
import 'package:board/screens/board_list.dart';
import 'package:flutter/material.dart';

enum LoginType { nexon, facebook, apple }

class ProcessLogin extends StatelessWidget {
  final LoginType loginType;

  const ProcessLogin({
    super.key,
    required this.loginType,
  });

  @override
  Widget build(BuildContext context) {
    var loginTypeText = switch (loginType) {
      LoginType.nexon => "넥슨",
      LoginType.facebook => "페이스북",
      _ => "애플"
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('$loginTypeText 로그인'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            FutureBuilder(
              future: Future.wait(
                [
                  Future.delayed(const Duration(milliseconds: 3000)),
                  setLogginedUser(
                    UserModel(platform: loginTypeText, id: '1', nickname: '미엘'),
                  )
                ],
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Future.microtask(() => Navigator.pop(context, () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BoardList(),
                          ),
                        );
                      }));
                }
                return Column(
                  children: [
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text("$loginTypeText 로그인 중..."),
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
