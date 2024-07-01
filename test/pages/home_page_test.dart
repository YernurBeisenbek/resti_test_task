import 'package:flutter_test/flutter_test.dart';
import 'package:resti_test_task/presentation/pages/home_page.dart';
import 'package:resti_test_task/presentation/state_management/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resti_test_task/domain/entities/post.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mock_use_cases.dart';

void main() {
  late MockGetPosts mockGetPosts;
  late MockSaveLikedPosts mockSaveLikedPosts;

  setUp(() {
    mockGetPosts = MockGetPosts();
    mockSaveLikedPosts = MockSaveLikedPosts();
  });

  testWidgets('HomePage displays list of posts', (WidgetTester tester) async {
    final posts = [
      Post(
        id: 1,
        title: 'Title 1',
        content: 'Content 1',
        publishedAt: '2024-06-30T06:00:00Z',
      ),
      Post(
        id: 2,
        title: 'Title 2',
        content: 'Content 2',
        publishedAt: '2024-06-30T05:16:40Z',
      ),
    ];

    when(mockGetPosts.call()).thenAnswer((_) async => posts);

    final newsProvider = NewsProvider(mockGetPosts, mockSaveLikedPosts);
    await newsProvider.fetchPosts();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: newsProvider,
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Title 1'), findsOneWidget);
    expect(find.text('Title 2'), findsOneWidget);
  });

  testWidgets('HomePage like button toggles like state', (WidgetTester tester) async {
    final posts = [
      Post(
        id: 1,
        title: 'Title 1',
        content: 'Content 1',
        publishedAt: '2024-06-30T06:00:00Z',
      ),
      Post(
        id: 2,
        title: 'Title 2',
        content: 'Content 2',
        publishedAt: '2024-06-30T05:16:40Z',
      ),
    ];

    when(mockGetPosts.call()).thenAnswer((_) async => posts);

    final newsProvider = NewsProvider(mockGetPosts, mockSaveLikedPosts);
    await newsProvider.fetchPosts();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: newsProvider,
        child: MaterialApp(
          home: HomePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite_border), findsNWidgets(2));

    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pump();

    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byIcon(Icons.favorite).first);
    await tester.pump();

    expect(find.byIcon(Icons.favorite_border), findsNWidgets(2));
  });
}
