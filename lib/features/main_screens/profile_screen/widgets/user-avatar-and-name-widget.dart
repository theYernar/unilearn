import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/resources/resources.dart';
import 'package:unilearn/settings/settings.dart';

class UserAvatarAndUserNameWidget extends StatelessWidget {
  const UserAvatarAndUserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return Column(
            children: [
              const SizedBox(
                height: 140,
                width: 140,
                child: Image(
                    fit: BoxFit.cover, image: AssetImage(AppImages.useravatar)),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'yernar',
                style: GoogleFonts.nunito(
                    fontSize: value, fontWeight: FontWeight.w600),
              )
            ],
          );
        });
  }
}
