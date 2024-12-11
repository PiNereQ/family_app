import 'package:flutter/material.dart';

import 'tile_widget.dart';

class TilesBoard extends StatelessWidget {
  final List<Map<String, dynamic>> tilesData;

  const TilesBoard({
    super.key,
    required this.tilesData,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: (tilesData.length / 2).ceil(), // Each row has two tiles
      itemBuilder: (context, index) {
        // Calculate indexes for alternating tiles
        final tileIndex1 = index * 2;
        final tileIndex2 = tileIndex1 + 1;

        // Retrieve the tiles data
        final tile1 = tilesData[tileIndex1];
        final tile2 = tileIndex2 < tilesData.length ? tilesData[tileIndex2] : null;

        // Alternate proportions
        final bool is60_40 = index % 2 == 0;

        return Row(
          children: [
            // First tile (e.g., 60% or 40%)
            Expanded(
              flex: is60_40 ? 6 : 4,
              child: TileWidget(
                title: tile1['title'],
                icon: tile1['icon'],
                onTap: tile1['onTap'],
              ),
            ),
            const SizedBox(width: 8), // Spacing between tiles
            // Second tile (e.g., 40% or 60%)
            if (tile2 != null) // Check if a second tile exists
              Expanded(
                flex: is60_40 ? 4 : 6,
                child: TileWidget(
                  title: tile2['title'],
                  icon: tile2['icon'],
                  onTap: tile2['onTap'],
                ),
              ),
          ],
        );
      },
    );
  }
}
