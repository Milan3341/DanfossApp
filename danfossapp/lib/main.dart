import 'package:danfossapp/bloc/Data.dart';
import 'package:danfossapp/bloc/PerKW.dart';
import 'package:danfossapp/bloc/comments_data.dart';
import 'package:danfossapp/bloc/posts_data.dart';
import 'package:danfossapp/config/routing.dart';
import 'package:danfossapp/config/theme.dart';
import 'package:danfossapp/screens/login_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DataBloc()),
        BlocProvider(create: (context) => PerkwBloc()),
        BlocProvider(create: (context) => PostBloc()),
        BlocProvider(create: (context) => CommentBloc())
      ],
      child: MaterialApp(
        builder: (context, child) => ResponsiveWrapper.builder(
          child,
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(680, name: TABLET),
          ],
        ),
        title: 'Danfoss Tools',
        initialRoute: MyCustomroutes.loginRoute,
        onGenerateRoute: MyCustomroutes.generateRoute,
        theme: ThemeProvider.themeOf(context).data,
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
      ),
    );
  }
}
