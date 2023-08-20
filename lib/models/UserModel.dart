class UserModel {
  final String platform, id, nickname;

  UserModel({
    required this.platform,
    required this.id,
    required this.nickname,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : platform = json['platform'],
        id = json['id'],
        nickname = json['nickname'];

  Map<String, dynamic> toJson() => {
        'platform': platform,
        'id': id,
        'nickname': nickname,
      };
}
