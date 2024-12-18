import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YouTubePlayer extends StatefulWidget {
  final String id;
  const YouTubePlayer({super.key, required this.id});

  @override
  _YouTubePlayerState createState() => _YouTubePlayerState();
}

class _YouTubePlayerState extends State<YouTubePlayer> {
  late final WebViewController _webViewController;
  late final String initialUrl; // Сделаем initialUrl членом класса

  @override
  void initState() {
    super.initState();
    // Инициализация URL
    initialUrl =
        'https://www.youtube.com/embed/${widget.id}?autoplay=1&controls=1&modestbranding=1&rel=0&hl=ru';
    // Инициализация WebViewController
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            // Если это URL YouTube (не переход на другие страницы)
            if (!url.startsWith('https://www.youtube.com/embed/')) {
              // Переводим WebView обратно на начальный URL (предотвращаем переход)
              _webViewController.loadRequest(Uri.parse(initialUrl));
            }
          },
          onPageFinished: (url) {
            // Можно сделать дополнительные проверки или обновления после загрузки страницы
          },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: WebViewWidget(
          controller:
              _webViewController, // Указываем контроллер в WebViewWidget
        )
      );
  }
}
