import "dart:convert";

import "package:flutter_web_api/models/journal.dart";
import "package:flutter_web_api/services/http_interceptors.dart";
import "package:http/http.dart" as http;
import "package:http_interceptor/http_interceptor.dart";

class JournalService {
  static const String url =
      "http://192.168.56.1:3000/"; //json-server --watch --host
  static const String resource = "journals/";

  http.Client client =
      InterceptedClient.build(interceptors: [LoggerInterceptor()]);

  String getUrl() {
    return "$url$resource";
  }

  Future<bool> register(Journal journal) async {
    try {
      String jsonJournal = json.encode(journal.toMap());
      http.Response response = await client.post(
        Uri.parse(
          getUrl(),
        ),
        headers: {"Content-Type": "application/json"},
        body: jsonJournal,
      );
      // final response = await client.post(
      //   Uri.parse(getUrl()),
      //   headers: {"Content-Type": "application/json"},
      //   body: jsonEncode({"content": journal}), // Converte o corpo para JSON
      // );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("Registro enviado com sucesso!");
        return true;
      } else {
        print("Erro ao enviar registro: ${response.statusCode}");
        print("Resposta do servidor: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Erro ao tentar enviar o registro: $e");
      return false;
    }
  }

  Future<String> get() async {
    http.Response response = await client.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
