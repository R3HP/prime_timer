import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:prime_timer/core/services/database/database.dart';
import 'package:prime_timer/core/services/database/shared_pref_database.dart';
import 'package:prime_timer/core/services/web_service/dio_web_service.dart';
import 'package:prime_timer/core/services/web_service/web_service.dart';
import 'package:prime_timer/features/prime/data/data_source/mined_number_datasource.dart';
import 'package:prime_timer/features/prime/data/data_source/number_data_source.dart';
import 'package:prime_timer/features/prime/data/repository/mined_number_repository_impl.dart';
import 'package:prime_timer/features/prime/domain/repository/mined_number_repository.dart';
import 'package:prime_timer/features/prime/domain/usecase/get_prime_number_with_elapsed_time_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> inject() async {
  //Services
  getIt.registerLazySingleton<WebService>(() => DioWebService(dio: Dio()));
  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<DataBase>(() => SharedPrefDatabase(sharedPreferences: sharedPref));

  // Usecases
  getIt.registerLazySingleton<GetPrimeNumberWithElapsedTimeUsecase>(() => GetPrimeNumberWithElapsedTimeUsecase(minedNumberRepository: getIt()));
  //Repositories
  getIt.registerLazySingleton<MinedNumberRepository>(() => MinedNumberRepositoryImpl(numberDataSource: getIt(), minedNumberDatasource: getIt()),);

  // DataSources
  getIt.registerLazySingleton<MinedNumberDatasource>(() => LocalMinedNumberDatasource(dataBase: getIt()));
  getIt.registerLazySingleton<NumberDataSource>(() => HttpNumberDataSource(webService: getIt()));
  

}