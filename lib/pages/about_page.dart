import 'package:animated_login/components/appdetailsmodel.dart';
import 'package:flutter/material.dart';

class AbouPage extends StatelessWidget {
  final List<Appdetails>? appData;

  const AbouPage({super.key, required this.appData});

  @override
  Widget build(BuildContext context) {
    if (appData == null || appData!.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('App Details'),
        ),
        body: Center(
          child: Text('No app data available.'),
        ),
      );
    }

    final appDetails = appData![0];

    return Scaffold(
      appBar: AppBar(
        title: Text('App Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildDetailRow('Content Rating', appDetails.contentRating),
                SizedBox(height: 20.0),
                _buildDetailRow('Release Date', appDetails.releaseDate.toString()),
                SizedBox(height: 20.0),
                _buildDetailRow('Version', appDetails.version),
                SizedBox(height: 20.0),
                _buildDetailRow('Supported OS', appDetails.supportedOs),
                SizedBox(height: 20.0),
                _buildDetailRow('Permissions', appDetails.permissions),
                SizedBox(height: 20.0),
                _buildDetailRow('Language', appDetails.language),
                SizedBox(height: 20.0),
                _buildDetailRow('Min SDK Version', appDetails.minSdkVersion),
                SizedBox(height: 20.0),
                _buildDetailRow('Featured', appDetails.featured),
                SizedBox(height: 20.0),
                _buildDetailRow('Category', appDetails.category),
                SizedBox(height: 20.0),
                _buildDetailRow('Developer', appDetails.developer),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
