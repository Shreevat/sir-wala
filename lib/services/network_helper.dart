import 'package:flutter_api/models/apiModel.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future<List<GetPost>?> getAPIResponse() async {
    var response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var body = response.body;
      var conversion = getPostFromJson(body);
      print(conversion);
      return conversion;
    } else {
      print('error');
    }
  }
}
