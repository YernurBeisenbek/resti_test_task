import 'package:resti_test_task/domain/entities/post.dart';

abstract class NewsRepository {
  Future<List<Post>> getPosts();
  Future<void> saveLikedPosts(List<Post> posts);
}
