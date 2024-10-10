import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final List<String> texts = ['Spring', 'Summer', 'Fall', 'Winter'];

  late ScrollController controller;

  @override
  void initState() {
    controller = ScrollController();
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: texts.length,
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              children: [
                Container(
                  transform: Matrix4.identity()
                    ..translate(
                        0.0,
                         controller.hasClients
                            ? (-(index * MediaQuery.of(context).size.height) +
                                    controller.position.pixels) /
                                2
                            : 0.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Image.asset(
                    'assets/${index + 1}.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Text(
                    texts[index],
                    style: GoogleFonts.kaushanScript(
                      fontSize: 100,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
