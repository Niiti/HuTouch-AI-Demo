   import 'dart:convert';
   import 'package:http/http.dart' as http;
   import '../models/team.dart';

   class TeamService {
     static const String baseUrl = 'https://6803759d-2bfb-4aa4-8ab1-ddc2ace685e8.mock.pstmn.io';

     Future<List<Team>> fetchTeams() async {
       final response = await http.get(Uri.parse('$baseUrl/get_teams_data'));

       if (response.statusCode == 200) {
         List<dynamic> json = jsonDecode(response.body);
         return json.map((e) => Team.fromJson(e)).toList();
       } else {
         throw Exception('Error fetching teams');
       }
     }
   }
