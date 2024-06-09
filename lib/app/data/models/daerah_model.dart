class Daerah {
  List<DataDaerah>? data;
  Links? links;
  Meta? meta;

  Daerah({this.data, this.links, this.meta});

  Daerah.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataDaerah>[];
      json['data'].forEach((v) {
        data?.add(DataDaerah.fromJson(v));
      });
    }
    links = json['links'] != null ? Links?.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta?.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links?.toJson();
    }
    if (meta != null) {
      data['meta'] = meta?.toJson();
    }
    return data;
  }
}

class DataDaerah {
  String? id;
  String? name;
  int? type;
  String? latitude;
  String? longitude;
  String? countryId;
  String? countryName;
  String? countryNameUppercase;
  String? provinceId;
  String? provinceName;
  String? regencyId;
  String? regencyName;
  String? districtId;
  String? districtName;
  String? villageId;
  String? villageName;
  String? fullName;
  String? nameTranslated;
  String? countryNameTranslated;
  String? countryNameTranslatedUppercase;

  DataDaerah(
      {this.id,
      this.name,
      this.type,
      this.latitude,
      this.longitude,
      this.countryId,
      this.countryName,
      this.countryNameUppercase,
      this.provinceId,
      this.provinceName,
      this.regencyId,
      this.regencyName,
      this.districtId,
      this.districtName,
      this.villageId,
      this.villageName,
      this.fullName,
      this.nameTranslated,
      this.countryNameTranslated,
      this.countryNameTranslatedUppercase});

  DataDaerah.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    countryNameUppercase = json['country_name_uppercase'];
    provinceId = json['province_id'];
    provinceName = json['province_name'];
    regencyId = json['regency_id'];
    regencyName = json['regency_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    villageId = json['village_id'];
    villageName = json['village_name'];
    fullName = json['full_name'];
    nameTranslated = json['name_translated'];
    countryNameTranslated = json['country_name_translated'];
    countryNameTranslatedUppercase = json['country_name_translated_uppercase'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['country_name_uppercase'] = countryNameUppercase;
    data['province_id'] = provinceId;
    data['province_name'] = provinceName;
    data['regency_id'] = regencyId;
    data['regency_name'] = regencyName;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['village_id'] = villageId;
    data['village_name'] = villageName;
    data['full_name'] = fullName;
    data['name_translated'] = nameTranslated;
    data['country_name_translated'] = countryNameTranslated;
    data['country_name_translated_uppercase'] = countryNameTranslatedUppercase;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    path = json['path'];
    perPage = int.parse(json['per_page']);
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}
