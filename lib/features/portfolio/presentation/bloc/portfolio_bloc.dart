import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/features/portfolio/data/repositories/mock_portfolio_repository.dart';
import 'package:portfolio/features/portfolio/presentation/bloc/portfolio_event.dart';
import 'package:portfolio/features/portfolio/presentation/bloc/portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final MockPortfolioRepository repository;

  PortfolioBloc({required this.repository}) : super(PortfolioInitial()) {
    on<LoadPortfolioDataEvent>(_onLoadPortfolioData);
  }

  Future<void> _onLoadPortfolioData(
      LoadPortfolioDataEvent event, Emitter<PortfolioState> emit) async {
    emit(PortfolioLoading());

    try {
      final skills = await repository.getSkills();
      final projects = await repository.getProjects();
      final experiences = await repository.getExperience();

      emit(PortfolioLoaded(
        skills: skills,
        projects: projects,
        experiences: experiences,
      ));
    } catch (e) {
      emit(PortfolioError(e.toString()));
    }
  }
}
