import 'package:resti_test_task/data/data_sources/news_api_service.dart';
import 'package:resti_test_task/data/data_sources/local_data_source.dart';
import 'package:resti_test_task/domain/entities/post.dart';
import 'package:resti_test_task/data/models/post_model.dart';
import 'package:resti_test_task/domain/respositories/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsApiService apiService;
  final LocalDataSource localDataSource;

  NewsRepositoryImpl(this.apiService, this.localDataSource);

  @override
  Future<List<Post>> getPosts() async {
    final postModels = await apiService.fetchPosts();
    return postModels.map((postModel) => Post(
      id: postModel.title.hashCode, // Using hashCode of title as an ID
      title: postModel.title,
      content: postModel.content ?? '',
      isLiked: false,
      urlToImage: postModel.urlToImage,
      author: postModel.author,
      publishedAt: postModel.publishedAt,
    )).toList();
  }

  @override
  Future<void> saveLikedPosts(List<Post> posts) async {
    await localDataSource.savePosts(posts.map((post) => PostModel(
      sourceName: post.author ?? 'Unknown',
      author: post.author,
      title: post.title,
      description: '',
      url: '',
      urlToImage: post.urlToImage,
      publishedAt: post.publishedAt,
      content: post.content,
      isLiked: post.isLiked,
    )).toList());
  }
}
