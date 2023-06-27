class DenunciaModel {
  final int id;
  final String? date;
  final String? time;
  final String? description;
  final String? image;

  DenunciaModel(this.id, this.date, this.time, this.description, this.image);

  factory DenunciaModel.fromJson(Map<String, dynamic> json) {
    return DenunciaModel(
      json['id'],
      json['date'],
      json['time'],
      json['description'],
      json['image'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': this.id,
        'date': this.date,
        'time': this.time,
        'description': this.description,
        'image': this.image,
      };
}
