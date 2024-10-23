
// import 'package:dio/dio.dart';

// import '../../models/mixes_for_you_model.dart';
// import '../../models/recently_played.dart';


// class MusicRepository {
//   final Dio _dio = Dio();

//   Future<List<RecentlyPlayedModel>> fetchRecentlyPlayed() async {
//     try {
//       final response = await _dio.get(
//         'https://6fba403d-eaa7-4507-af58-82539765d405.mock.pstmn.io/recently-played'
//         );
//       return (response.data['results'] as List)
//           .map((item) => RecentlyPlayedModel.fromJson(item))
//           .toList();
//     } catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }

//   Future<List<MixesForYouModel>> fetchMixesForYou() async {
//     try {
//       final response = await _dio.get(
//         'https://6fba403d-eaa7-4507-af58-82539765d405.mock.pstmn.io/mixes-for-you'
//       );
//       return (response.data['results'] as List)
//           .map((item) => MixesForYouModel.fromJson(item))
//           .toList();
//     } catch (e) {
//       print('Error: $e');
//       return [];
//     }
//   }
// }