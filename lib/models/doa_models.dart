class DoaModel{

  int? id;
  String? doa;
  String? artinya;
  String? ayat;


  DoaModel({
    this.id,
    this.doa,
    this.artinya,
    this.ayat,
  });

  DoaModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    doa = json['doa'];
    ayat = json['ayat'];
    artinya = json['artinya'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doa': doa,
      'ayat': ayat,
      'artinya': artinya,
    };
  }
}