import 'package:get/get.dart';
import 'package:jala_media/app/data/models/kabar_udang_model.dart';
import 'package:jala_media/app/services/repositories/kabar_udang_repository.dart';

class KabarUdangController extends GetxController {
  RxList<DataKabarUdang> listKabarUdang = List<DataKabarUdang>.empty().obs;

  // Pagination
  RxInt page = 1.obs;
  RxBool fetchLoading = false.obs;
  RxBool fetchNextLoading = false.obs;
  RxBool isNextPage = false.obs;

  RxInt webviewLoading = 0.obs;

  final repo = KabarUdangRepository();

  @override
  void onInit() {
    super.onInit();
    resetValue();
    fetchKabarUdang();
  }

  void fetchKabarUdang() async {
    if (listKabarUdang.isEmpty) {
      fetchLoading.value = true;
    } else {
      fetchNextLoading.value = true;
    }

    await repo.getKabarUdang(page: page.value).then((res) {
      if (res.links?.next != null) {
        isNextPage.value = true;
        page.value += 1;
      } else {
        isNextPage.value = false;
      }
      listKabarUdang.addAll(res.data ?? []);

      fetchNextLoading.value = false;
      fetchLoading.value = false;
    });
  }

  resetValue() {
    listKabarUdang.value = [];
    page.value = 1;
    fetchLoading.value = false;
    fetchNextLoading.value = false;
    isNextPage.value = false;
  }
}
