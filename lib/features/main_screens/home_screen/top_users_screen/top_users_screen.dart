import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/features/main_screens/home_screen/top_users_screen/data/top_user_list_data.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/theme/styles.dart';

class TopUsersScreen extends StatelessWidget {
  const TopUsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _HeaderWidget(),
          _CustomAppBar(),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _HeaderWidget extends StatelessWidget {
  _HeaderWidget({
    super.key,
  });
  Color background = AppColors.background;
  Color textColor = Colors.black;

  var rating;

  @override
  Widget build(BuildContext context) {
    usersList.sort((a, b) => b.point.compareTo(a.point));
    return ListView.builder(
      padding: const EdgeInsets.only(top: 140),
      itemCount: usersList.length,
      itemBuilder: (context, index) {
        final TopUsersData data = usersList[index];
        switch (index + 1) {
          case 1:
            rating = const Image(image: AssetImage(Ranks.medal1));
            break;
          case 2:
            rating = const Image(image: AssetImage(Ranks.medal2));
            break;
          case 3:
            rating = const Image(image: AssetImage(Ranks.medal3));
            break;
          default:
            rating = Center(
              child: Text(
                '${index + 1}',
                style: GoogleFonts.nunito(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue),
              ),
            );
            break;
        }

        if (data.isMe != false) {
          background = const Color.fromARGB(129, 168, 197, 236);
          textColor = AppColors.blue;
        } else {
          background = AppColors.background;
          textColor = Colors.black;
        }

        return Container(
          color: background,
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
          child: Row(
            children: [
              SizedBox(width: 45, child: rating),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 55,
                height: 55,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Image(fit: BoxFit.cover, image: AssetImage(data.avatar)),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Text(
                  data.username,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.nunito(
                    color: textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '${data.point} очков',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.nunito(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 5,
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const HugeIcon(
                icon: HugeIcons.strokeRoundedArrowLeft01,
                color: Colors.black,
                size: 35,
              )),
          const SizedBox(
            width: 10,
          ),
          Text(
            'Рейтинг пользователей',
            style: CustomTextStyles().TitleTextStyle(24),
          ),
        ],
      ),
    );
  }
}
