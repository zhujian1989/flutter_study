
class FLModel{

  final String  url;

  const FLModel({this.url});

  FLModel.fromJson(Map<String, dynamic> json)
      : url = json['url'];

  Map<String, dynamic> toJson() =>
      {
        'url': url,
      };

}

