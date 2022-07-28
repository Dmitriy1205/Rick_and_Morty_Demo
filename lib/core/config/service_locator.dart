import 'package:get_it/get_it.dart';
import 'package:rick_and_morty/data/repository/data_repository.dart';
import 'package:rick_and_morty/presentation/bloc/home_cubit.dart';

final sl = GetIt.instance;

Future<void> boot() async {
  sl.registerLazySingleton(() => DataRepository());
  sl.registerFactory(() => HomeCubit(repo: sl()));
}

