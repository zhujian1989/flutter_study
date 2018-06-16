class HotNewsModel {

  final String date;

  final List stories;

  final List top_stories;

  const HotNewsModel({this.date, this.stories, this.top_stories});

}

class HotNewsStoriesModel {
  final List images;
  final int type;
  final int id;
  final String title;

  const HotNewsStoriesModel({this.images, this.type, this.id, this.title});

  HotNewsStoriesModel.fromJson(Map<String, dynamic> json)
      : images = json['images'],
        type = json['type'],
        id = json['id'],
        title = json['title'];
}

class HotNewsTopStoriesModel {
  final String image;
  final int type;
  final int id;
  final String title;

  const HotNewsTopStoriesModel({this.image, this.type, this.id, this.title});

  HotNewsTopStoriesModel.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        type = json['type'],
        id = json['id'],
        title = json['title'];
}
