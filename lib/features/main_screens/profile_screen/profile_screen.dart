import 'package:flutter/material.dart';
import 'package:unilearn/features/main_screens/profile_screen/widgets/logout-widget.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/styles.dart';
import './widgets/user-avatar-and-name-widget.dart';
import './widgets/user-information-widget.dart';
import './widgets/settings-widget.dart';
import './widgets/support-widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        _MainTitle(),
        SizedBox(height: 20,),
        UserAvatarAndUserNameWidget(),
        _HeaderWidget(),
      ],
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Информация',
                  style: CustomTextStyles().TitleTextStyle(value - 2),
                ),
                const SizedBox(height: 15),
                const UserInformationBodyWidget(),
                const SizedBox(height: 30),
                Text(
                  'Настройки',
                  style: CustomTextStyles().TitleTextStyle(value-2),
                ),
                const SizedBox(height: 15),
                const SettingsWidget(),
                const SizedBox(height: 30),
                const SupportWidget(),
                const SizedBox(height: 10),
                const LogoutWidget(),
              ],
            ),
          );
        }
      );
  }
}


class _MainTitle extends StatelessWidget {
  const _MainTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, top: 40),
            child: Text(
              'Профиль',
              style: CustomTextStyles().TitleTextStyle(value + 4),
            ),
          );
        });
  }
}
