import 'package:board/screens/process_login.dart';
import 'package:board/widgets/video_player_screen.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  handlePress(
      {required BuildContext context, required LoginType loginType}) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => ProcessLogin(
          loginType: loginType,
        ),
      ),
    );

    if (result != null && result is Function) {
      result();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const VideoPlayerScreen(),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 52,
                ),
                Image.asset(
                  'assets/logo.png',
                  width: 120,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "모두의 게시판",
                  style: TextStyle(
                    fontSize: 48,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0, // shadow blur
                        color: Colors.white, // shadow color
                        offset:
                            Offset(2.0, 2.0), // how much shadow will be shown
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 240,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                        ),
                        onPressed: () => handlePress(
                          context: context,
                          loginType: LoginType.nexon,
                        ),
                        icon: const Image(
                          image: AssetImage(
                            "assets/nexon.png",
                          ),
                          width: 48.0,
                        ),
                        label: const Text(
                          '넥슨 계정으로 로그인',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                        ),
                        onPressed: () => handlePress(
                          context: context,
                          loginType: LoginType.facebook,
                        ),
                        icon: const Icon(
                          Icons.facebook,
                          color: Color.fromARGB(255, 20, 20, 21),
                        ),
                        label: const Text(
                          '페이스북으로 로그인',
                          style: TextStyle(
                            color: Color.fromARGB(255, 20, 20, 21),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 240,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                        ),
                        onPressed: () => handlePress(
                          context: context,
                          loginType: LoginType.apple,
                        ),
                        icon: const Icon(
                          Icons.apple,
                          color: Color.fromARGB(255, 20, 20, 21),
                        ),
                        label: const Text(
                          '애플로 로그인',
                          style: TextStyle(
                            color: Color.fromARGB(255, 20, 20, 21),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
