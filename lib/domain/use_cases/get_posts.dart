import 'package:resti_test_task/domain/entities/post.dart';
import 'package:resti_test_task/domain/respositories/news_repository.dart';

class GetPosts {
  final NewsRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call() async {
    return await repository.getPosts();
  }
}
