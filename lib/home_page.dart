import 'package:flutter/material.dart';
import 'package:voice_assistant/pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Athrav'),
        centerTitle: true,
        leading: Icon(
          Icons.menu,
        ),
      ),
      body: Column(
        children: [
          // Virtual Assistant Picture
          Stack(
            children: [
              Center(
                child: Container(
                  height: 120,
                  width: 120,
                  margin: const EdgeInsets.only(
                    top: 4,
                  ),
                  decoration: const BoxDecoration(
                    color: Pallete.assistantCircleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Container(
                height: 123,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/virtualAssistant.png',
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Chat Bubble
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            margin:
                const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ).copyWith(
                topLeft: Radius.zero,
              ),
              border: Border.all(
                color: Pallete.borderColor,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Hello Good Morning! What can I do for you today',
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  fontSize: 25,
                ),
              ),
            ),
          ),
          // Suggestion Text
          Container(
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.only(
              top: 10,
              left: 22,
            ),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Here are a few Suggestions',
              style: TextStyle(
                fontFamily: 'Cera Pro',
                color: Pallete.mainFontColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          // Feature List
        ],
      ),
    );
  }
}
