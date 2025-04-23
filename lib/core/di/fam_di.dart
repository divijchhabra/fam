import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:fam_assignment/core/network/base_request.dart';
import 'package:fam_assignment/features/contextual_cards/bloc/contextual_cards_bloc.dart';
import 'package:fam_assignment/features/contextual_cards/repository/contextual_cards_repository_contract.dart';
import 'package:fam_assignment/features/contextual_cards/repository/contextual_cards_repository_impl.dart';

class FamDI {
  static final FamDI instance = FamDI._internal();
  final GetIt _getIt = GetIt.instance;

  FamDI._internal();

  Future<void> initialize() async {
    // Core
    _getIt.registerLazySingleton<http.Client>(http.Client.new);
    _getIt.registerLazySingleton<WebService>(
      () => WebService(client: _getIt()),
    );

    // Repository
    _getIt.registerLazySingleton<ContextualCardsRepositoryContract>(
      () => ContextualCardsRepositoryImpl(webService: _getIt()),
    );

    // BLoC
    _getIt.registerFactory<ContextualCardsBloc>(
      () => ContextualCardsBloc(repository: _getIt()),
    );
  }

  T get<T extends Object>() => _getIt.get<T>();
} 