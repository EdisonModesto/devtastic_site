import 'package:devtastic_site/presentation/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'data/provider/TextGroup.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => TextGroupProvider()),
    ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ResponsiveWrapper.builder(
            child,
            maxWidth: 1920,
            minWidth: 280,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.autoScaleDown(480, name: MOBILE),
              ResponsiveBreakpoint.autoScaleDown(800, name: TABLET),
             // ResponsiveBreakpoint.autoScale(1000, name: "1100"),
              ResponsiveBreakpoint.autoScaleDown(1440, name: "1440"),
              ResponsiveBreakpoint.autoScaleDown(1900, name: DESKTOP),
            ],
            background: Container(color: Color(0xFFF5F5F5)),
        );
      },
      title: 'Devtastic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Devtastic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const NavBar();
  }
}
