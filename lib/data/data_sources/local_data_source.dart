import 'package:shared_preferences/shared_preferences.dart';
import 'package:resti_test_task/data/models/post_model.dart';
import 'dart:convert';

class LocalDataSource {
  static const String _likedPostsKey = 'LIKED_POSTS';

  Future<void> savePosts(List<PostModel> posts) async {
    final prefs = await SharedPreferences.getInstance();
    final String postsJson = jsonEncode(posts.map((post) => post.toJson()).toList());
    await prefs.setString(_likedPostsKey, postsJson);
  }

  Future<List<PostModel>> getLikedPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final String? postsJson = prefs.getString(_likedPostsKey);
    if (postsJson != null) {
      List<dynamic> postsList = jsonDecode(postsJson);
      return postsList.map((post) => PostModel.fromJson(post)).toList();
    } else {
      return [];
    }
  }
}
