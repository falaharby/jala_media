import 'package:get/get.dart';

import '../models/kabar_udang_model.dart';

class KabarUdangProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return KabarUdang.fromJson(map);
      if (map is List)
        return map.map((item) => KabarUdang.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<KabarUdang?> getKabarUdang(int id) async {
    final response = await get('kabarudang/$id');
    return response.body;
  }

  Future<Response<KabarUdang>> postKabarUdang(KabarUdang kabarudang) async =>
      await post('kabarudang', kabarudang);
  Future<Response> deleteKabarUdang(int id) async =>
      await delete('kabarudang/$id');
}
