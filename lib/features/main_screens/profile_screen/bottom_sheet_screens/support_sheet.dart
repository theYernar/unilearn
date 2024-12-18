import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/settings/settings.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/theme/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportSheet extends StatefulWidget {
  const SupportSheet({super.key});

  @override
  State<SupportSheet> createState() => _SupportSheetState();
}

class _SupportSheetState extends State<SupportSheet> {

final String username = "theYernar"; // Замените на ваш Telegram username

  Future<void> _launchTelegramProfile() async {
    final String telegramUrl = "tg://resolve?domain=$username"; // Открыть в приложении
    final String webUrl = "https://t.me/$username"; // Открыть в браузере

    final Uri telegramUri = Uri.parse(telegramUrl);
    if (await canLaunchUrl(telegramUri)) {
      await launchUrl(telegramUri); // Попытаться открыть приложение
    } else {
      await launchUrl(Uri.parse(webUrl)); // Если приложение недоступно, открыть браузер
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
        valueListenable: globalSliderNotifier,
        builder: (context, value, child) {
          return SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  const SizedBox(height: 25,),
                  Text(
                    'Вы можете сообщить о проблеме написав мне в telegram 👇', 
                    style: CustomTextStyles().ProfileTextStyle(value - 3),
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: _launchTelegramProfile, 
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(value - 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: AppColors.blue
                    ),
                    child: Text(
                      'Открыть Telegram',
                      style: GoogleFonts.nunito(
                        color: AppColors.white,
                        fontSize: value - 8
                      ),
                    )
                  )
                ],
              ),
            ),
          );
        });
  }
}
