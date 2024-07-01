import 'package:resti_test_task/domain/entities/post.dart';
import 'package:resti_test_task/domain/respositories/news_repository.dart';

class SaveLikedPosts {
  final NewsRepository repository;

  SaveLikedPosts(this.repository);

  Future<void> call(List<Post> posts) async {
    await repository.saveLikedPosts(posts);
  }
}
