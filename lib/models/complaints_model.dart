class ComplaintsModel {
  List<Items>? _items;

  ComplaintsModel({List<Items>? items}) {
    if (items != null) {
      this._items = items;
    }
  }

  List<Items>? get items => _items;
  set items(List<Items>? items) => _items = items;

  ComplaintsModel.fromJson(Map<String, dynamic> json) {
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
  String? _tktnoC;
  String? _cstidC;
  String? _tktremarks;
  String? _prncplrefno;
  String? _tktstsid;
  String? _tktdttm;
  String? _sbsname;
  String? _email1;

  Items(
      {String? tktnoC,
        String? cstidC,
        String? tktremarks,
        String? prncplrefno,
        String? tktstsid,
        String? tktdttm,
        String? sbsname,
        String? email1}) {
    if (tktnoC != null) {
      this._tktnoC = tktnoC;
    }
    if (cstidC != null) {
      this._cstidC = cstidC;
    }
    if (tktremarks != null) {
      this._tktremarks = tktremarks;
    }
    if (prncplrefno != null) {
      this._prncplrefno = prncplrefno;
    }
    if (tktstsid != null) {
      this._tktstsid = tktstsid;
    }
    if (tktdttm != null) {
      this._tktdttm = tktdttm;
    }
    if (sbsname != null) {
      this._sbsname = sbsname;
    }
    if (email1 != null) {
      this._email1 = email1;
    }
  }

  String? get tktnoC => _tktnoC;
  set tktnoC(String? tktnoC) => _tktnoC = tktnoC;
  String? get cstidC => _cstidC;
  set cstidC(String? cstidC) => _cstidC = cstidC;
  String? get tktremarks => _tktremarks;
  set tktremarks(String? tktremarks) => _tktremarks = tktremarks;
  String? get prncplrefno => _prncplrefno;
  set prncplrefno(String? prncplrefno) => _prncplrefno = prncplrefno;
  String? get tktstsid => _tktstsid;
  set tktstsid(String? tktstsid) => _tktstsid = tktstsid;
  String? get tktdttm => _tktdttm;
  set tktdttm(String? tktdttm) => _tktdttm = tktdttm;
  String? get sbsname => _sbsname;
  set sbsname(String? sbsname) => _sbsname = sbsname;
  String? get email1 => _email1;
  set email1(String? email1) => _email1 = email1;

  Items.fromJson(Map<String, dynamic> json) {
    _tktnoC = json['tktno_c'];
    _cstidC = json['cstid_c'];
    _tktremarks = json['tktremarks'];
    _prncplrefno = json['prncplrefno'];
    _tktstsid = json['tktstsid'];
    _tktdttm = json['tktdttm'];
    _sbsname = json['sbsname'];
    _email1 = json['email1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tktno_c'] = this._tktnoC;
    data['cstid_c'] = this._cstidC;
    data['tktremarks'] = this._tktremarks;
    data['prncplrefno'] = this._prncplrefno;
    data['tktstsid'] = this._tktstsid;
    data['tktdttm'] = this._tktdttm;
    data['sbsname'] = this._sbsname;
    data['email1'] = this._email1;
    return data;
  }
}