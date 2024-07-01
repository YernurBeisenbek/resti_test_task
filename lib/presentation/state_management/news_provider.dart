import 'package:flutter/material.dart';
import 'package:resti_test_task/domain/entities/post.dart';
import 'package:resti_test_task/domain/use_cases/get_posts.dart';
import 'package:resti_test_task/domain/use_cases/save_liked_posts.dart';

class NewsProvider with ChangeNotifier {
  final GetPosts getPosts;
  final SaveLikedPosts saveLikedPosts;

  NewsProvider(this.getPosts, this.saveLikedPosts) {
    fetchPosts();
  }

  List<Post> _posts = [];
  List<Post> get posts => _posts;

  Future<void> fetchPosts() async {
    _posts = await getPosts();
    notifyListeners();
  }

  void toggleLike(Post post) {
    post.isLiked = !post.isLiked;
    notifyListeners();
    saveLikedPosts(_posts);
  }
}
