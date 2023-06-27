// import 'dart:convert';
// import 'package:http/http.dart';

// class HttpService {
//   final String baseUrl = "https://leoferrarezi.com/queimada/Complaint/read.php";

//   Future<List> getDenuncias() async {
//     Response res = await get(baseUrl);

//     if (res.statusCode == 200) {
//       List<dynamic> body = jsonDecode(res.body);

//       List denuncias = body
//           .map(
//             (dynamic item) => Post.fromJson(item),
//           )
//           .toList();

//       return denuncias;
//     } else {
//       throw "Unable to retrieve posts.";
//     }
//   }
// }
