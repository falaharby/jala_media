import 'package:get/get.dart';
import 'package:jala_media/app/data/models/daerah_model.dart';
import 'package:jala_media/app/data/models/harga_udang_model.dart';
import 'package:jala_media/app/services/repositories/harga_udang_repository.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class HargaUdangController extends GetxController {
  RxList<int> listSize = List<int>.empty().obs;
  RxList<DataUdang> listDataHargaUdang = List<DataUdang>.empty().obs;
  RxInt size = 20.obs;

  // Pagination
  RxInt page = 1.obs;
  RxBool fetchLoading = false.obs;
  RxBool fetchNextLoading = false.obs;
  RxBool isNextPage = false.obs;

  Rxn<DataDaerah> selectedDaerah = Rxn<DataDaerah>();

  final repo = HargaUdangRepository();

  @override
  void onInit() {
    super.onInit();
    resetValue();
    fetchHargaUdang();
  }

  void fetchHargaUdang() async {
    try {
      if (listDataHargaUdang.isEmpty) {
        fetchLoading.value = true;
      } else {
        fetchNextLoading.value = true;
      }

      await repo
          .getHargaUdang(
              page: page.value, regionId: selectedDaerah.value?.id ?? '')
          .then((res) {
        if (res.links?.next != null) {
          isNextPage.value = true;
          page.value += 1;
        } else {
          isNextPage.value = false;
        }
        listDataHargaUdang.addAll(res.dataUdang ?? []);

        fetchNextLoading.value = false;
        fetchLoading.value = false;
      });
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  List<int> getListSize() {
    if (listSize.isEmpty) {
      int size = 20;

      do {
        listSize.add(size);
        size += 10;
      } while (size <= 200);
    }

    return listSize;
  }

  resetValue() {
    listDataHargaUdang.value = [];
    page.value = 1;
    fetchLoading.value = false;
    fetchNextLoading.value = false;
    isNextPage.value = false;
  }
}
