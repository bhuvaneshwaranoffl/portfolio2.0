import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/di/injection_container.dart' as di;
import 'core/theme/app_theme.dart';
import 'features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'features/portfolio/presentation/bloc/portfolio_event.dart';
import 'features/portfolio/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 900), // Standard desktop desktop design size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Bhuvaneshwaran Portfolio',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.darkTheme,
          home: BlocProvider(
            create: (_) => di.sl<PortfolioBloc>()..add(LoadPortfolioDataEvent()),
            child: const HomePage(),
          ),
        );
      },
    );
  }
}
