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
      buildPage("0", Colors.red),
      buildPage("1", Colors.blue),
      buildPage("2", Colors.green),
      buildPage("3", Colors.amber),
      buildPage("4", Colors.deepPurple),
      buildPage("5", Colors.teal),
      buildPage("6", Colors.pink),
      buildPage("7", Colors.brown),
      buildPage("8", Colors.green),
      buildPage("9", Colors.greenAccent),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalItems,
        (index) {
          if (totalItems <= 5) {
            return buildDot(30, index, curlIndexDot);
          } else {
            double size = 5;
            if (curlIndexDot <= 2) {
              if (index <= 2) {
                size = 15;
              } else if (index == 3) {
                size = 10;
              } else {
                size = 5;
              }
              return buildDot(size, index, curlIndexDot);
            } else if (curlIndexDot >= totalItems - 3) {
              if (index == totalItems - 3 ||
                  index == totalItems - 2 ||
                  index == totalItems - 1) {
                size = 15;
              } else if (index == totalItems - 4) {
                size = 10;
              } else {
                size = 5;
              }
              return buildDot(size, index, curlIndexDot);
            } else {
              if (index == curlIndexDot) {
                size = 15;
              } else if (index == curlIndexDot - 1 ||
                  index == curlIndexDot + 1) {
                size = 10;
              } else {
                size = 5;
              }
              return buildDot(size, index, curlIndexDot);
            }
          }
        },
      ),
    );
  }
}

Widget buildDot(double size, int index, int curIndexDot) {
  return Container(
    height: size,
    width: size,
    margin: const EdgeInsets.symmetric(horizontal: 5),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: index == curIndexDot ? Colors.blue : Colors.white,
    ),
  );
}
