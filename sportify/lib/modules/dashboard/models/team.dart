class Team {
     final int id;
     final String name;
     final String logoUrl;
     

     Team({
       required this.id,
       required this.name,
       required this.logoUrl,
     });

     factory Team.fromJson(Map<String, dynamic> json) {
       return Team(
         id: json['id'] as int,
         name: json['name'] as String,
         logoUrl: json['logoUrl'] as String,
       );
     }
   }
