
// import 'package:flutter/material.dart';
// import '../../models/mixes_for_you_model.dart';
// import '../data/music_repository.dart';

// class MixesForYouSection extends StatelessWidget {
//   final MusicRepository _musicRepository = MusicRepository();

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<MixesForYouModel>>(
//       future: _musicRepository.fetchMixesForYou(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Text('No Mixes Available');
//         } else {
//           final mixes = snapshot.data!;
//           return ListView.builder(
//             shrinkWrap: true,
//             itemCount: mixes.length,
//             itemBuilder: (context, index) {
//               final mix = mixes[index];
//               return ListTile(
//                 leading: Image.network(mix.imageUrl),
//                 title: Text(mix.name),
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }