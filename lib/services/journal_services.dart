import "dart:convert";

import "package:http/http.dart" as http;

class JournalService {
  static const String url = "http://192.168.51.149:3000/";
  static const String resource = "learnhttp";

  String getUrl() {
    return "$url$resource";
  }

  Future<void> register(String content) async {
    try {
      final response = await http.post(
        Uri.parse(getUrl()),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"content": content}), // Converte o corpo para JSON
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Registro enviado com sucesso!");
      } else {
        print("Erro ao enviar registro: ${response.statusCode}");
        print("Resposta do servidor: ${response.body}");
      }
    } catch (e) {
      print("Erro ao tentar enviar o registro: $e");
    }
  }

  Future<String> get() async {
    http.Response response = await http.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
