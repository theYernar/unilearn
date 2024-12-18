import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:unilearn/theme/colors.dart';
import 'package:unilearn/theme/styles.dart';

class RankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Система рейтинга',
          style: CustomTextStyles().TitleTextStyle(24),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRankSection('Bronze', Colors.brown, [
              RankData(range: '0 - 500', label: 'Bronze III'),
              RankData(range: '500 - 1000', label: 'Bronze II'),
              RankData(range: '1000 - 1500', label: 'Bronze I'),
            ]),
            Divider(thickness: 2),
            _buildRankSection('Silver', Colors.grey, [
              RankData(range: '1500 - 2000', label: 'Silver III'),
              RankData(range: '2000 - 2500', label: 'Silver II'),
              RankData(range: '2500 - 3000', label: 'Silver I'),
            ]),
            Divider(thickness: 2),
            _buildRankSection('Gold', Colors.amber, [
              RankData(range: '3000 - 3500', label: 'Gold III'),
              RankData(range: '3500 - 4000', label: 'Gold II'),
              RankData(range: '4000 - 4500', label: 'Gold I'),
              RankData(range: '4500+', label: 'Gold'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildRankSection(String title, Color color, List<RankData> ranks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.nunito(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        SizedBox(height: 8),
        ...ranks.map((rank) => _buildRankTile(rank)).toList(),
      ],
    );
  }

  Widget _buildRankTile(RankData rank) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: Colors.grey,
            size: 30,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              rank.label,
              style: GoogleFonts.nunito(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            '${rank.range} очков',
            style: GoogleFonts.nunito(
              fontSize: 20,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class RankData {
  final String range;
  final String label;

  RankData({required this.range, required this.label});
}

void main() {
  runApp(MaterialApp(
    home: RankScreen(),
  ));
}
