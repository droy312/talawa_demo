import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';

class LinkPreviewPage extends StatelessWidget {
  const LinkPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _LinkPreviewWidget(link: 'https://twitter.com/alexwidua/status/1630998774247030786'),
            _LinkPreviewWidget(link: 'https://www.ndtv.com/world-news/elon-musk-sets-automatic-poop-emoji-response-on-twitter-for-press-enquires-3875595'),
            _LinkPreviewWidget(link: 'https://www.thehindu.com/sci-tech/technology/twitter-to-end-two-factor-authentication-for-non-blue-subscribers-today/article66641047.ece'),
          ],
        ),
      ),
    );
  }
}

class _LinkPreviewWidget extends StatelessWidget {
  const _LinkPreviewWidget({
    Key? key,
    required this.link,
  }) : super(key: key);

  final String link;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: AnyLinkPreview(
        link: link,
        displayDirection: UIDirection.uiDirectionHorizontal,
        showMultimedia: true,
        bodyMaxLines: 5,
        bodyTextOverflow: TextOverflow.ellipsis,
        titleStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        bodyStyle: const TextStyle(color: Colors.grey, fontSize: 12),
        errorBody: 'Show my custom error body',
        errorTitle: 'Show my custom error title',
        errorWidget: Container(
          color: Colors.grey[300],
          child: const Text('Oops!'),
        ),
        errorImage: 'https://google.com/',
        cache: const Duration(days: 7),
        backgroundColor: Colors.grey[300],
        borderRadius: 12,
        removeElevation: false,
        boxShadow: const [BoxShadow(blurRadius: 3, color: Colors.grey)],
        onTap: () {}, // This disables tap event
      ),
    );
  }
}
