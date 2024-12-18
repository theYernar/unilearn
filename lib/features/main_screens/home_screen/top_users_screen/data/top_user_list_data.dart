import 'package:unilearn/resources/resources.dart';

class TopUsersData {
  final String avatar;
  final String username;
  final int point;
  final bool? isMe;

  TopUsersData(
      {required this.avatar, required this.username, required this.point, required this.isMe});
}

final List<TopUsersData> usersList = [
  TopUsersData(avatar: UserAvatars.avatar1, username: 'yernar', point: 4600, isMe: true ),
  TopUsersData(avatar: UserAvatars.avatar2, username: 'beka', point: 4000, isMe: false),
  TopUsersData(avatar: UserAvatars.avatar4, username: 'aleksey', point: 4080, isMe: false),
  TopUsersData(avatar: UserAvatars.noavatar, username: 'beknur', point: 3090, isMe: false),
  TopUsersData(avatar: UserAvatars.avatar3, username: 'noname', point: 2444, isMe: false),
  TopUsersData(avatar: UserAvatars.avatar4, username: 'roman', point: 4300, isMe: false),
];
