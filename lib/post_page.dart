import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    Key? key,
    required this.title,
    required this.imageURL,
    required this.body,
  }) : super(key: key);

  final String title;
  final String? imageURL;
  final String body;

  Future<Uri> createLink() async {
    final DynamicLinkParameters dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse("https://com.example.talawa_demo?page=post&title=$title&imageURL=$imageURL&body=$body"),
      uriPrefix: "https://talawademo.page.link",
      androidParameters: const AndroidParameters(packageName: "com.example.talawa_demo"),
    );
    final ShortDynamicLink dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
    return dynamicLink.shortUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: imageURL != null
                ? Image.network(
                    imageURL!,
                    fit: BoxFit.cover,
                  )
                : Container(color: Colors.redAccent),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(body),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () async {
              final Uri uri = await createLink();
              Share.share(uri.toString());
            },
            child: const Icon(Icons.share,),
          ),
        ],
      ),
    );
  }
}
