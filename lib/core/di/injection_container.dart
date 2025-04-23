import 'package:fam_assignment/core/network/base_request.dart';
import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_bloc.dart';
import 'package:fam_assignment/features/contextual_cards/repository/contextual_cards_repository_contract.dart';
import 'package:fam_assignment/features/contextual_cards/repository/contextual_cards_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Http client
  getIt.registerLazySingleton<http.Client>(http.Client.new);

  // Web Service
  getIt.registerLazySingleton<WebService>(
    () => WebService(client: getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<ContextualCardsRepositoryContract>(
    () => ContextualCardsRepositoryImpl(webService: getIt()),
  );

  // BLoCs
  getIt.registerFactory<ContextualCardsBloc>(
    () => ContextualCardsBloc(repository: getIt()),
  );
} 