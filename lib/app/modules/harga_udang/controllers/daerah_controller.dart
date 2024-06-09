import 'package:get/get.dart';
import 'package:jala_media/app/data/models/daerah_model.dart';
import 'package:jala_media/app/services/repositories/daerah_repository.dart';

class DaerahController extends GetxController {
  RxList<DataDaerah> listDaerah = List<DataDaerah>.empty().obs;

  // Pagination
  RxInt page = 1.obs;
  RxBool fetchLoading = false.obs;
  RxBool fetchNextLoading = false.obs;
  RxBool isNextPage = false.obs;

  // Search
  RxString search = ''.obs;

  final repo = DaerahRepository();

  @override
  void onInit() {
    super.onInit();
    resetValue();
    fetchDaerah();
  }

  fetchDaerah() async {
    if (listDaerah.isEmpty) {
      fetchLoading.value = true;
    } else {
      fetchNextLoading.value = true;
    }

    await repo.getDaerah(page: page.value, search: search.value).then((res) {
      if (res.links?.next != null) {
        isNextPage.value = true;
        page.value += 1;
      } else {
        isNextPage.value = false;
      }

      listDaerah.addAll(res.data ?? []);

      fetchNextLoading.value = false;
      fetchLoading.value = false;
    });
  }

  resetValue() {
    listDaerah.value = [];
    page.value = 1;
    fetchLoading.value = false;
    fetchNextLoading.value = false;
    isNextPage.value = false;
  }
}
