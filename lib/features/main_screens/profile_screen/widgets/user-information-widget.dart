import 'package:flutter/material.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:unilearn/features/main_screens/profile_screen/data/profile-data.dart';
import './container-body-data-widget.dart';

class UserInformationBodyWidget extends StatelessWidget {
  const UserInformationBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: containerStyle(),
      child: Column(
        children: userInformation
            .asMap()
            .entries
            .map((entry) {
              final index = entry.key;
              final data = entry.value;
              final isLast = index == userInformation.length - 1;
              return ContainerBodyDateWidget(data: data, isLast: isLast);
            })
            .toList(),
      )
    );
  }
}
