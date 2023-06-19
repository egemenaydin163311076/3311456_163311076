class Odeme{
  int? id;
  String? odemeturu;
  String? tutar;
  String? sonodemetarihi;
  String? sirket;

  Odeme({this.id, this.odemeturu, this.tutar, this.sonodemetarihi, this.sirket});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }
    map['odemeturu'] = odemeturu;
    map['tutar'] = tutar;
    map['sonodemetarihi'] = sonodemetarihi;
    map['sirket'] = sirket;

    return map;
  }

  Odeme.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.odemeturu = map['odemeturu'];
    this.tutar = map['tutar'];
    this.sonodemetarihi = map['sonodemetarihi'];
    this.sirket = map['sirket'];
  }
}