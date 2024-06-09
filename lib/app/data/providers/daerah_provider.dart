import 'package:get/get.dart';

import '../models/daerah_model.dart';

class DaerahProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Daerah.fromJson(map);
      if (map is List) return map.map((item) => Daerah.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Daerah?> getDaerah(int id) async {
    final response = await get('daerah/$id');
    return response.body;
  }

  Future<Response<Daerah>> postDaerah(Daerah daerah) async =>
      await post('daerah', daerah);
  Future<Response> deleteDaerah(int id) async => await delete('daerah/$id');
}
