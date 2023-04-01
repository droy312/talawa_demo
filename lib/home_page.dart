import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:talawa_demo/link_preview_page.dart';
import 'package:talawa_demo/pip_video_page.dart';
import 'package:talawa_demo/post_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    this.link,
  }) : super(key: key);

  final Uri? link;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    if (widget.link != null) {
      Map<String, String> queryParams = widget.link!.queryParameters;
      if (queryParams['page'] == 'post') {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => PostPage(
                      title: queryParams['title'].toString(),
                      imageURL: queryParams['imageURL'],
                      body: queryParams['body'].toString(),
                    )));
      }
    }

    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      Map<String, String> queryParams = dynamicLinkData.link.queryParameters;
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => PostPage(
                    title: queryParams['title'].toString(),
                    imageURL: queryParams['imageURL'],
                    body: queryParams['body'].toString(),
                  )));
    }).onError((error) {
      // Handle errors
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => PipVideoPage()));
              },
              child: const Text('PIP Video'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const LinkPreviewPage()));
              },
              child: const Text('Link Preview'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const PostPage(
                              title:
                                  'Arsenal suffer devastating blow as extent of Takehiro Tomiyasu injury confirmed',
                              imageURL:
                                  'https://i0.wp.com/arsenalfclatestnews.com/wp-content/uploads/2020/03/Arsenal-Players-Pictures-Team-Photo-Badges-Funny-Pictures-scaled.jpg?resize=768%2C498&ssl=1',
                              body: '''
                              Arsenal have confirmed that Takehiro Tomiyasu will miss the rest of the season after sustaining a serious knee injury during the Gunners' clash with Sporting CP last Thursday.

The right-back limped off in the ninth minute of the Europa League last-16 second-leg tie after he injured himself lunging into a tackle. Tomiyasu, who was replaced by Ben White, left the Emirates Stadium in crutches and Mikel Arteta didn't sound confident when asked about his condition.
                              ''',
                            )));
              },
              child: const Text('Post'),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
