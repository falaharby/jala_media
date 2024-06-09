import 'package:jala_media/app/data/models/daerah_model.dart';
import 'package:jala_media/app/services/api.dart';

class DaerahRepository {
  Future<Daerah> getDaerah({int? page, String? search = ''}) async {
    var res = await Api().get(
      '/regions',
      queryParameters: {
        'has': 'shrimp_prices',
        'page': page,
        'per_page': 20,
        'search': search,
      },
    );

    return Daerah.fromJson(res.data);
  }
}
