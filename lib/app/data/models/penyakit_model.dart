class Penyakit {
  List<DataPenyakit>? data;
  Links? links;
  Meta? meta;

  Penyakit({this.data, this.links, this.meta});

  Penyakit.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataPenyakit>[];
      json['data'].forEach((v) {
        data?.add(DataPenyakit.fromJson(v));
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

class DataPenyakit {
  int? id;
  String? fullName;
  String? shortName;
  String? image;
  String? slug;
  String? metaDescription;
  String? metaKeywords;
  String? status;
  String? indication;
  String? pathogen;
  String? effect;
  String? stabilityViability;
  String? handling;
  String? regulation;
  String? reference;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;

  DataPenyakit(
      {this.id,
      this.fullName,
      this.shortName,
      this.image,
      this.slug,
      this.metaDescription,
      this.metaKeywords,
      this.status,
      this.indication,
      this.pathogen,
      this.effect,
      this.stabilityViability,
      this.handling,
      this.regulation,
      this.reference,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt});

  DataPenyakit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    shortName = json['short_name'];
    image = json['image'];
    slug = json['slug'];
    metaDescription = json['meta_description'];
    metaKeywords = json['meta_keywords'];
    status = json['status'];
    indication = json['indication'];
    pathogen = json['pathogen'];
    effect = json['effect'];
    stabilityViability = json['stability_viability'];
    handling = json['handling'];
    regulation = json['regulation'];
    reference = json['reference'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['short_name'] = shortName;
    data['image'] = image;
    data['slug'] = slug;
    data['meta_description'] = metaDescription;
    data['meta_keywords'] = metaKeywords;
    data['status'] = status;
    data['indication'] = indication;
    data['pathogen'] = pathogen;
    data['effect'] = effect;
    data['stability_viability'] = stabilityViability;
    data['handling'] = handling;
    data['regulation'] = regulation;
    data['reference'] = reference;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

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
  String? perPage;
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
    perPage = json['per_page'];
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
