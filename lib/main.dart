import 'package:dot/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<HomeCubit>(
        create: (context) {
          return HomeCubit();
        },
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HomeCubit homeCubit;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    homeCubit = BlocProvider.of(context);
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      buildPage("1", Colors.blue),
      buildPage("2", Colors.green),
      buildPage("3", Colors.amber),
      buildPage("4", Colors.deepPurple),
      buildPage("5", Colors.teal),
      buildPage("6", Colors.pink),
      buildPage("7", Colors.amber),
      buildPage("8", Colors.deepPurple),
      buildPage("9", Colors.teal),
    ];

    return Scaffold(
      backgroundColor: Colors.black12,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return SizedBox(
            height: 300,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    controller: controller,
                    onPageChanged: homeCubit.onChangedPage,
                    children: items,
                  ),
                ),
                listDot(items.length, state.curlIndexDot)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildPage(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        color: color,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget listDot(int totalItems, int curlIndexDot) {
    Widget buildDotWithSize(double size, int index) {
      return buildDot(size, index, curlIndexDot);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
        (index) => buildDotWithSize(
            homeCubit.determineSize(
              index,
              totalItems,
            ),
            index),
      ),
    );
  }

  Widget buildDot(double size, int index, int curIndexDot) {
    return AnimatedContainer(
      height: size,
      width: size,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: index == curIndexDot ? Colors.blue : Colors.white,
      ),
      duration: const Duration(seconds: 1),
      // Provide an optional curve to make the animation feel smoother.
      curve: Curves.fastOutSlowIn,
    );
  }
}
