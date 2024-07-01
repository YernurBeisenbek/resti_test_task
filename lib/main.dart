import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:resti_test_task/data/data_sources/local_data_source.dart';
import 'package:resti_test_task/data/data_sources/news_api_service.dart';
import 'package:resti_test_task/data/repositories/news_repository_impl.dart';
import 'package:resti_test_task/domain/use_cases/get_posts.dart';
import 'package:resti_test_task/domain/use_cases/save_liked_posts.dart';
import 'package:resti_test_task/presentation/state_management/news_provider.dart';
import 'package:resti_test_task/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => NewsApiService());
  getIt.registerLazySingleton(() => LocalDataSource());
  getIt.registerLazySingleton(() => NewsRepositoryImpl(getIt<NewsApiService>(), getIt<LocalDataSource>()));
  getIt.registerLazySingleton(() => GetPosts(getIt<NewsRepositoryImpl>()));
  getIt.registerLazySingleton(() => SaveLikedPosts(getIt<NewsRepositoryImpl>()));
}

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(getIt<GetPosts>(), getIt<SaveLikedPosts>()),
        ),
      ],
      child: MaterialApp(
        title: 'News Feed App',
        home: HomePage(),
      ),
    );
  }
}
