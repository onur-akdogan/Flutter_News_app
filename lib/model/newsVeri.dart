
import 'dart:convert';

CovidData covidDataFromJson(String str) => CovidData.fromMap(json.decode(str));

String covidDataToJson(CovidData data) => json.encode(data.toMap());

class CovidData {
    bool success;
    List<Result> result;

    CovidData({
        this.success,
        this.result,
    });

    factory CovidData.fromMap(Map<String, dynamic> json) => CovidData(
        success: json["success"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
    };
}

class Result {
    String key;
    String description;
    String image;
    String name;
    String source;
    String url;

    Result({
        this.key,
        this.description,
        this.image,
        this.name,
        this.source, 
        this.url,
    });

    factory Result.fromMap(Map<String, dynamic> json) => Result(
        key: json["key"],
        url: json["url"],
        description: json["description"],
        image: json["image"],
        name: json["name"],
        source: json["source"],
    );

    Map<String, dynamic> toMap() => {
        "key": key,
        "url": url,
        "description": description,
        "image": image,
        "name": name,
        "source": source,
    };
}
