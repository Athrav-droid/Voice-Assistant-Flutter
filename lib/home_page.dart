import 'package:flutter/material.dart';
import 'package:voice_assistant/feature_box.dart';
import 'package:voice_assistant/pallete.dart';
import 'package:speech_to_text/speech_to_text.dart';

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Virtual Assistant Picture
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 115,
                    width: 115,
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
                  height: 118,
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
                vertical: 8,
                horizontal: 20,
              ),
              margin:
                  const EdgeInsets.symmetric(horizontal: 40).copyWith(top: 25),
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
                    fontSize: 22,
                  ),
                ),
              ),
            ),
            // Suggestion Text
            Container(
              padding: const EdgeInsets.all(8),
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Feature List
            const Column(
              children: [
                FeatureBox(
                  color: Pallete.firstSuggestionBoxColor,
                  headerText: 'ChatGPT',
                  DescriptionText:
                      "A Smarter way to stay organized and informed with chatGPT",
                ),
                FeatureBox(
                  color: Pallete.secondSuggestionBoxColor,
                  headerText: 'DALLE-AI',
                  DescriptionText:
                      "A Smarter way to stay use dalle is to informed with Dalle Ai the most",
                ),
                FeatureBox(
                  color: Pallete.thirdSuggestionBoxColor,
                  headerText: 'Smart Voice Assistant',
                  DescriptionText:
                      "Top Class Smart Voice Assistant in your hand with Latest Feature",
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.mic),
        backgroundColor: Pallete.firstSuggestionBoxColor,
      ),
    );
  }
}
