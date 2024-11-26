import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../repositories/map_repository.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  late final MapRepository _mapRepository;
  late Future<String> _mapTileUrlFuture;

  @override
  void initState() {
    super.initState();
    final apiKey = dotenv.env['API_KEY'] ?? '';
    if (apiKey.isEmpty) {
      throw Exception('API_KEY not found in environment variables.');
    }
    _mapRepository = MapRepository(apiKey: apiKey);
    _fetchInitialMapTile();
  }

  void _fetchInitialMapTile() {
    setState(() {
      // Adjust coordinates (x, y) and zoom level (zoom) as needed
      _mapTileUrlFuture = _mapRepository.fetchMapTileUrl(2, 2, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      body: FutureBuilder<String>(
        future: _mapTileUrlFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // **Loading State Management**: Display a loader while waiting for data
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // **Error Handling**: Display an error message if something goes wrong
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data == null) {
            // **Empty State Management**: Handle the case when no data is returned
            return const Center(
              child: Text('No map tile available'),
            );
          } else {
            // **Display Map Tile**
            final tileUrl = snapshot.data!;
            return Center(
              child: Image.network(
                tileUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  // Show a loader while the image is loading
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  // Handle image loading errors
                  return const Text('Failed to load map tile');
                },
              ),
            );
          }
        },
      ),
    );
  }
}