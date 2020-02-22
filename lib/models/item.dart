class ItemModel {
  List<String> images;
  String nom;
  double prix;
  String description;
  String date;
  double fraisDePort;

  ItemModel(
      {this.images,
        this.nom,
        this.prix,
        this.description,
        this.date,
        this.fraisDePort});

  ItemModel.fromJson(Map<String, dynamic> json) {
    images = json['images'].cast<String>();
    nom = json['nom'];
    prix = json['prix'];
    description = json['description'];
    date = json['date'];
    fraisDePort = json['fraisDePort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['images'] = this.images;
    data['nom'] = this.nom;
    data['prix'] = this.prix;
    data['description'] = this.description;
    data['date'] = this.date;
    data['fraisDePort'] = this.fraisDePort;
    return data;
  }
}