import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:unilearn/theme/styles.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Stack(
      children: [
        const _CustomAppBar(),
        SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth:  MediaQuery.of(context).size.width
            ),
            child: const _HeaderWidget()
          ),
        ),
      ],
    ));
  }

}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
      ],
    );
  }
}



class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final title = arguments['title'];

    return Positioned(
        top: 70,
        left: 16,
        right: 16,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                HugeIcons.strokeRoundedCancel01,
                size: 30,
              ),
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: CustomTextStyles().TitleTextStyle(24),
              ),
            ),
          ],
        ));
  }
}
