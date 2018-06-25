class AIModel{

  final String desc;
  final List images;
  final String publishedAt;
  final String url;
  final String who;

  const AIModel({this.desc,this.images,this.publishedAt,this.url,this.who});

  AIModel.fromJson(Map<String, dynamic> json)
      :
        desc=json['desc'],
        images=json['images'],
        publishedAt = json['publishedAt'],
        url = json['url'],
        who = json['who']
  ;

}

