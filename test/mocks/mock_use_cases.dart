import 'package:mockito/mockito.dart';
import 'package:resti_test_task/domain/respositories/news_repository.dart';
import 'package:resti_test_task/domain/use_cases/get_posts.dart';
import 'package:resti_test_task/domain/use_cases/save_liked_posts.dart';

class MockGetPosts extends Mock implements GetPosts {}

class MockSaveLikedPosts extends Mock implements SaveLikedPosts {}

class MockNewsRepository extends Mock implements NewsRepository {}
