class Movies {
  String? title;
  String? director;
  String? writer;
  String? releaseDate;
  String? genre;
  String? plotSummary;
  String? image;

  Movies(
      {this.title,
      this.director,
      this.writer,
      this.releaseDate,
      this.genre,
      this.plotSummary,
      this.image});

  factory Movies.fromJson(Map json) {
    return Movies(
    title :json['title'],
    director :json['Director'],
    writer : json['Writer'],
    releaseDate :json['Release Date'],
    genre : json['Genre'],
    plotSummary :json['Plot Summary'],
    image : json['image'],
);
  }
 

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['title'] = this.title;
  //   data['Director'] = this.director;
  //   data['Writer'] = this.writer;
  //   data['Release Date'] = this.releaseDate;
  //   data['Genre'] = this.genre;
  //   data['Plot Summary'] = this.plotSummary;
  //   data['image'] = this.image;
  //   return data;
  // }
}