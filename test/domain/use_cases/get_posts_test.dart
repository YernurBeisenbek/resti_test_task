import 'package:flutter_test/flutter_test.dart';
import 'package:resti_test_task/domain/entities/post.dart';
import 'package:resti_test_task/domain/use_cases/get_posts.dart';
import 'package:mockito/mockito.dart';

import '../../mocks/mock_use_cases.dart';

void main() {
  late GetPosts getPosts;
  late MockNewsRepository mockNewsRepository;


  setUp(() {
    mockNewsRepository = MockNewsRepository();
    getPosts = GetPosts(mockNewsRepository);
  });

  test('should get list of posts from the repository', () async {
    final posts = [
      Post(
        id: 1,
        title: 'Title 1',
        content: 'Content 1',
        publishedAt: '2024-06-30T06:00:00Z',
      ),
    ];

    when(mockNewsRepository.getPosts()).thenAnswer((_) async => posts);

    final result = await getPosts();

    expect(result, posts);
    verify(mockNewsRepository.getPosts());
    verifyNoMoreInteractions(mockNewsRepository);
  });
}
