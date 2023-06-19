import 'dart:convert';

import 'package:covid_19_stat_flutter/Model/world_stats_model.dart';
import 'package:covid_19_stat_flutter/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatsServices {
  Future<WorldStatsModel> fetchWorldStatsRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
      
    }else {
      throw Exception('Error');
    }
  }
}
