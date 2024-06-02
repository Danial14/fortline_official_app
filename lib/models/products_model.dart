class ProductsModel {
  List<Items>? _items;

  ProductsModel({List<Items>? items}) {
    if (items != null) {
      this._items = items;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      _items = <Items>[];
      json['items'].forEach((v) {
        _items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._items != null) {
      data['items'] = this._items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? _cmitmPk;
  String? _itmid;
  String? _itmdsc;
  String? _uom;
  String? _itmtypdsc;
  Null? _itmlocdsc;
  String? _itmclsdsc;
  Null? _brandid;
  String? _imploc;
  Null? _itmdscpur;
  String? _itmdscsal;
  Null? _itmpic1;
  Null? _itmpic2;
  Null? _itmpic3;

  Items(
      {int? cmitmPk,
        String? itmid,
        String? itmdsc,
        String? uom,
        String? itmtypdsc,
        Null? itmlocdsc,
        String? itmclsdsc,
        Null? brandid,
        String? imploc,
        Null? itmdscpur,
        String? itmdscsal,
        Null? itmpic1,
        Null? itmpic2,
        Null? itmpic3}) {
    if (cmitmPk != null) {
      this._cmitmPk = cmitmPk;
    }
    if (itmid != null) {
      this._itmid = itmid;
    }
    if (itmdsc != null) {
      this._itmdsc = itmdsc;
    }
    if (uom != null) {
      this._uom = uom;
    }
    if (itmtypdsc != null) {
      this._itmtypdsc = itmtypdsc;
    }
    if (itmlocdsc != null) {
      this._itmlocdsc = itmlocdsc;
    }
    if (itmclsdsc != null) {
      this._itmclsdsc = itmclsdsc;
    }
    if (brandid != null) {
      this._brandid = brandid;
    }
    if (imploc != null) {
      this._imploc = imploc;
    }
    if (itmdscpur != null) {
      this._itmdscpur = itmdscpur;
    }
    if (itmdscsal != null) {
      this._itmdscsal = itmdscsal;
    }
    if (itmpic1 != null) {
      this._itmpic1 = itmpic1;
    }
    if (itmpic2 != null) {
      this._itmpic2 = itmpic2;
    }
    if (itmpic3 != null) {
      this._itmpic3 = itmpic3;
    }
  }

  int? get cmitmPk => _cmitmPk;
  set cmitmPk(int? cmitmPk) => _cmitmPk = cmitmPk;
  String? get itmid => _itmid;
  set itmid(String? itmid) => _itmid = itmid;
  String? get itmdsc => _itmdsc;
  set itmdsc(String? itmdsc) => _itmdsc = itmdsc;
  String? get uom => _uom;
  set uom(String? uom) => _uom = uom;
  String? get itmtypdsc => _itmtypdsc;
  set itmtypdsc(String? itmtypdsc) => _itmtypdsc = itmtypdsc;
  Null? get itmlocdsc => _itmlocdsc;
  set itmlocdsc(Null? itmlocdsc) => _itmlocdsc = itmlocdsc;
  String? get itmclsdsc => _itmclsdsc;
  set itmclsdsc(String? itmclsdsc) => _itmclsdsc = itmclsdsc;
  Null? get brandid => _brandid;
  set brandid(Null? brandid) => _brandid = brandid;
  String? get imploc => _imploc;
  set imploc(String? imploc) => _imploc = imploc;
  Null? get itmdscpur => _itmdscpur;
  set itmdscpur(Null? itmdscpur) => _itmdscpur = itmdscpur;
  String? get itmdscsal => _itmdscsal;
  set itmdscsal(String? itmdscsal) => _itmdscsal = itmdscsal;
  Null? get itmpic1 => _itmpic1;
  set itmpic1(Null? itmpic1) => _itmpic1 = itmpic1;
  Null? get itmpic2 => _itmpic2;
  set itmpic2(Null? itmpic2) => _itmpic2 = itmpic2;
  Null? get itmpic3 => _itmpic3;
  set itmpic3(Null? itmpic3) => _itmpic3 = itmpic3;

  Items.fromJson(Map<String, dynamic> json) {
    _cmitmPk = json['cmitm_pk'];
    _itmid = json['itmid'];
    _itmdsc = json['itmdsc'];
    _uom = json['uom'];
    _itmtypdsc = json['itmtypdsc'];
    _itmlocdsc = json['itmlocdsc'];
    _itmclsdsc = json['itmclsdsc'];
    _brandid = json['brandid'];
    _imploc = json['imploc'];
    _itmdscpur = json['itmdscpur'];
    _itmdscsal = json['itmdscsal'];
    _itmpic1 = json['itmpic1'];
    _itmpic2 = json['itmpic2'];
    _itmpic3 = json['itmpic3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cmitm_pk'] = this._cmitmPk;
    data['itmid'] = this._itmid;
    data['itmdsc'] = this._itmdsc;
    data['uom'] = this._uom;
    data['itmtypdsc'] = this._itmtypdsc;
    data['itmlocdsc'] = this._itmlocdsc;
    data['itmclsdsc'] = this._itmclsdsc;
    data['brandid'] = this._brandid;
    data['imploc'] = this._imploc;
    data['itmdscpur'] = this._itmdscpur;
    data['itmdscsal'] = this._itmdscsal;
    data['itmpic1'] = this._itmpic1;
    data['itmpic2'] = this._itmpic2;
    data['itmpic3'] = this._itmpic3;
    return data;
  }
}