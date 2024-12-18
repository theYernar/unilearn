import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/colors.dart';

class EmailSheet extends StatelessWidget {
  const EmailSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: globalSliderNotifier,
      builder: (context, value, child)  { return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: SizedBox(
          height: 400,
          child: Column(
            children: [
              Container(
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                'email',
                style: GoogleFonts.nunito(
                  fontSize: value
                ),
              )
            ],
          ),
        ),
      );
  });
}}
