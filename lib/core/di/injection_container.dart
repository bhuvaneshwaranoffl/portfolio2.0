import 'package:get_it/get_it.dart';
import 'package:portfolio/features/portfolio/data/repositories/mock_portfolio_repository.dart';
import 'package:portfolio/features/portfolio/presentation/bloc/portfolio_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => PortfolioBloc(repository: sl()));

  // Use cases (Skip for now as requirements say minimal Domain/Data layer for portfolio)

  // Repository
  sl.registerLazySingleton<MockPortfolioRepository>(() => MockPortfolioRepository());

  // Core & External
}
