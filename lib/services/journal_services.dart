import "dart:convert";

import "package:flutter_web_api/services/http_interceptors.dart";
import "package:http/http.dart" as http;
import "package:http_interceptor/http_interceptor.dart";

class JournalService {
  static const String url = "http://192.168.51.149:3000/";
  static const String resource = "learnhttp";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<void> register(String content) async {
    try {
      final response = await client.post(
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
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
