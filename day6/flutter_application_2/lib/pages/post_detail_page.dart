import 'package:flutter/material.dart';

import '../models/post.dart';
import '../services/post_api.dart';
import '../widgets/app_error.dart';
import '../widgets/app_loading.dart';

class PostDetailPage extends StatefulWidget {
  final int postId;
  const PostDetailPage({super.key, required this.postId});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late Future<Post> _futureDetail;

  @override
  void initState() {
    super.initState();
    _futureDetail = PostApi.fetchPostDetail(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post #${widget.postId}')),
      body: FutureBuilder<Post>(
        future: _futureDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const AppLoading();
          }

          if (snapshot.hasError) {
            return AppError(error: snapshot.error!);
          }

          final post = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.title, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 12),
                Text(post.body),
              ],
            ),
          );
        },
      ),
    );
  }
}
