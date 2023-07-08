import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:voice_assistant/secrets.dart';

class OpenAIService {
  final List<Map<String, String>> messages = [];
  Future<String> isArtPromptAPI(String prompt) async {
    try {
      print("res ke upar");
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        // Headers and body format are written on the basis of Documentation might Change in Future.
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIApiKey3',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {
              'role': 'user',
              'content':
                  'Does this message want to generate an Image, Art, AI Picture or anything similar $prompt. Simply answer me in yes or no',
            }
          ],
        }),
      );

      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim().toLowerCase();
        switch (content) {
          case 'yes':
          case 'yes.':
            final res = await dallEAPI(prompt);
            return res;
          default:
            final res = await chatgptAPI(prompt);
            return res;
        }
      }
      return "Some Internal Error Occur";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> chatgptAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        // Headers and body format are written on the basis of Documentation might Change in Future.
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIApiKey2',
        },
        body: jsonEncode({"model": "gpt-3.5-turbo", "messages": messages}),
      );
      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();
        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return "Some Internal Error Occur";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> dallEAPI(String prompt) async {
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/images/generations'),
        // Headers and body format are written on the basis of Documentation might Change in Future.
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $openAIApiKey2',
        },
        body: jsonEncode({
          'prompt': prompt,
          'n': 1,
        }),
      );

      print(res.body);
      print(res.statusCode);
      if (res.statusCode == 200) {
        String imageUrl = jsonDecode(res.body)['data'][0]['url'];
        imageUrl = imageUrl.trim();
        messages.add({
          'role': 'assistant',
          'content': imageUrl,
        });
        return imageUrl;
      }
      return "Some Internal Error Occur";
    } catch (e) {
      return e.toString();
    }
  }
}
