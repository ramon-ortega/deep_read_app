import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String apiKey = dotenv.env['API_KEY'] ?? 'No hay API KEY';
}
