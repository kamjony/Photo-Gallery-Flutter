// To parse this JSON data, do
//
//     final allPhotosList = allPhotosListFromJson(jsonString);

import 'dart:convert';

List<AllPhotosListModel> allPhotosListFromJson(String str) => List<AllPhotosListModel>.from(json.decode(str).map((x) => AllPhotosListModel.fromJson(x)));

String allPhotosListToJson(List<AllPhotosListModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPhotosListModel {
  AllPhotosListModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.promotedAt,
    this.width,
    this.height,
    this.color,
    this.blurHash,
    this.description,
    this.altDescription,
    this.urls,
    this.links,
    this.categories,
    this.likes,
    this.likedByUser,
    this.currentUserCollections,
    this.sponsorship,
    this.topicSubmissions,
    this.user,
  });

  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  dynamic altDescription;
  Urls? urls;
  AllPhotosListLinks? links;
  List<dynamic>? categories;
  int? likes;
  bool? likedByUser;
  List<dynamic>? currentUserCollections;
  Sponsorship? sponsorship;
  TopicSubmissions? topicSubmissions;
  User? user;

  factory AllPhotosListModel.fromJson(Map<String, dynamic> json) => AllPhotosListModel(
    id: json["id"] == null ? null : json["id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    promotedAt: json["promoted_at"] == null ? null : DateTime.parse(json["promoted_at"]),
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
    color: json["color"] == null ? null : json["color"],
    blurHash: json["blur_hash"] == null ? null : json["blur_hash"],
    description: json["description"] == null ? null : json["description"],
    altDescription: json["alt_description"],
    urls: json["urls"] == null ? null : Urls.fromJson(json["urls"]),
    links: json["links"] == null ? null : AllPhotosListLinks.fromJson(json["links"]),
    categories: json["categories"] == null ? null : List<dynamic>.from(json["categories"].map((x) => x)),
    likes: json["likes"] == null ? null : json["likes"],
    likedByUser: json["liked_by_user"] == null ? null : json["liked_by_user"],
    currentUserCollections: json["current_user_collections"] == null ? null : List<dynamic>.from(json["current_user_collections"].map((x) => x)),
    sponsorship: json["sponsorship"] == null ? null : Sponsorship.fromJson(json["sponsorship"]),
    topicSubmissions: json["topic_submissions"] == null ? null : TopicSubmissions.fromJson(json["topic_submissions"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "promoted_at": promotedAt == null ? null : promotedAt!.toIso8601String(),
    "width": width == null ? null : width,
    "height": height == null ? null : height,
    "color": color == null ? null : color,
    "blur_hash": blurHash == null ? null : blurHash,
    "description": description == null ? null : description,
    "alt_description": altDescription,
    "urls": urls == null ? null : urls!.toJson(),
    "links": links == null ? null : links!.toJson(),
    "categories": categories == null ? null : List<dynamic>.from(categories!.map((x) => x)),
    "likes": likes == null ? null : likes,
    "liked_by_user": likedByUser == null ? null : likedByUser,
    "current_user_collections": currentUserCollections == null ? null : List<dynamic>.from(currentUserCollections!.map((x) => x)),
    "sponsorship": sponsorship == null ? null : sponsorship!.toJson(),
    "topic_submissions": topicSubmissions == null ? null : topicSubmissions!.toJson(),
    "user": user == null ? null : user!.toJson(),
  };
}

class AllPhotosListLinks {
  AllPhotosListLinks({
    this.self,
    this.html,
    this.download,
    this.downloadLocation,
  });

  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  factory AllPhotosListLinks.fromJson(Map<String, dynamic> json) => AllPhotosListLinks(
    self: json["self"] == null ? null : json["self"],
    html: json["html"] == null ? null : json["html"],
    download: json["download"] == null ? null : json["download"],
    downloadLocation: json["download_location"] == null ? null : json["download_location"],
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? null : self,
    "html": html == null ? null : html,
    "download": download == null ? null : download,
    "download_location": downloadLocation == null ? null : downloadLocation,
  };
}

class Sponsorship {
  Sponsorship({
    this.impressionUrls,
    this.tagline,
    this.taglineUrl,
    this.sponsor,
  });

  List<String>? impressionUrls;
  String? tagline;
  String? taglineUrl;
  User? sponsor;

  factory Sponsorship.fromJson(Map<String, dynamic> json) => Sponsorship(
    impressionUrls: json["impression_urls"] == null ? null : List<String>.from(json["impression_urls"].map((x) => x)),
    tagline: json["tagline"] == null ? null : json["tagline"],
    taglineUrl: json["tagline_url"] == null ? null : json["tagline_url"],
    sponsor: json["sponsor"] == null ? null : User.fromJson(json["sponsor"]),
  );

  Map<String, dynamic> toJson() => {
    "impression_urls": impressionUrls == null ? null : List<dynamic>.from(impressionUrls!.map((x) => x)),
    "tagline": tagline == null ? null : tagline,
    "tagline_url": taglineUrl == null ? null : taglineUrl,
    "sponsor": sponsor == null ? null : sponsor!.toJson(),
  };
}

class User {
  User({
    this.id,
    this.updatedAt,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
    this.social,
  });

  String? id;
  DateTime? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    username: json["username"] == null ? null : json["username"],
    name: json["name"] == null ? null : json["name"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    twitterUsername: json["twitter_username"] == null ? null : json["twitter_username"],
    portfolioUrl: json["portfolio_url"] == null ? null : json["portfolio_url"],
    bio: json["bio"] == null ? null : json["bio"],
    location: json["location"] == null ? null : json["location"],
    links: json["links"] == null ? null : UserLinks.fromJson(json["links"]),
    profileImage: json["profile_image"] == null ? null : ProfileImage.fromJson(json["profile_image"]),
    instagramUsername: json["instagram_username"] == null ? null : json["instagram_username"],
    totalCollections: json["total_collections"] == null ? null : json["total_collections"],
    totalLikes: json["total_likes"] == null ? null : json["total_likes"],
    totalPhotos: json["total_photos"] == null ? null : json["total_photos"],
    acceptedTos: json["accepted_tos"] == null ? null : json["accepted_tos"],
    forHire: json["for_hire"] == null ? null : json["for_hire"],
    social: json["social"] == null ? null : Social.fromJson(json["social"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
    "username": username == null ? null : username,
    "name": name == null ? null : name,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "twitter_username": twitterUsername == null ? null : twitterUsername,
    "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
    "bio": bio == null ? null : bio,
    "location": location == null ? null : location,
    "links": links == null ? null : links!.toJson(),
    "profile_image": profileImage == null ? null : profileImage!.toJson(),
    "instagram_username": instagramUsername == null ? null : instagramUsername,
    "total_collections": totalCollections == null ? null : totalCollections,
    "total_likes": totalLikes == null ? null : totalLikes,
    "total_photos": totalPhotos == null ? null : totalPhotos,
    "accepted_tos": acceptedTos == null ? null : acceptedTos,
    "for_hire": forHire == null ? null : forHire,
    "social": social == null ? null : social!.toJson(),
  };
}

class UserLinks {
  UserLinks({
    this.self,
    this.html,
    this.photos,
    this.likes,
    this.portfolio,
    this.following,
    this.followers,
  });

  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
    self: json["self"] == null ? null : json["self"],
    html: json["html"] == null ? null : json["html"],
    photos: json["photos"] == null ? null : json["photos"],
    likes: json["likes"] == null ? null : json["likes"],
    portfolio: json["portfolio"] == null ? null : json["portfolio"],
    following: json["following"] == null ? null : json["following"],
    followers: json["followers"] == null ? null : json["followers"],
  );

  Map<String, dynamic> toJson() => {
    "self": self == null ? null : self,
    "html": html == null ? null : html,
    "photos": photos == null ? null : photos,
    "likes": likes == null ? null : likes,
    "portfolio": portfolio == null ? null : portfolio,
    "following": following == null ? null : following,
    "followers": followers == null ? null : followers,
  };
}

class ProfileImage {
  ProfileImage({
    this.small,
    this.medium,
    this.large,
  });

  String? small;
  String? medium;
  String? large;

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
    small: json["small"] == null ? null : json["small"],
    medium: json["medium"] == null ? null : json["medium"],
    large: json["large"] == null ? null : json["large"],
  );

  Map<String, dynamic> toJson() => {
    "small": small == null ? null : small,
    "medium": medium == null ? null : medium,
    "large": large == null ? null : large,
  };
}

class Social {
  Social({
    this.instagramUsername,
    this.portfolioUrl,
    this.twitterUsername,
    this.paypalEmail,
  });

  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  dynamic paypalEmail;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    instagramUsername: json["instagram_username"] == null ? null : json["instagram_username"],
    portfolioUrl: json["portfolio_url"] == null ? null : json["portfolio_url"],
    twitterUsername: json["twitter_username"] == null ? null : json["twitter_username"],
    paypalEmail: json["paypal_email"],
  );

  Map<String, dynamic> toJson() => {
    "instagram_username": instagramUsername == null ? null : instagramUsername,
    "portfolio_url": portfolioUrl == null ? null : portfolioUrl,
    "twitter_username": twitterUsername == null ? null : twitterUsername,
    "paypal_email": paypalEmail,
  };
}

class TopicSubmissions {
  TopicSubmissions({
    this.health,
  });

  Health? health;

  factory TopicSubmissions.fromJson(Map<String, dynamic> json) => TopicSubmissions(
    health: json["health"] == null ? null : Health.fromJson(json["health"]),
  );

  Map<String, dynamic> toJson() => {
    "health": health == null ? null : health!.toJson(),
  };
}

class Health {
  Health({
    this.status,
    this.approvedOn,
  });

  String? status;
  DateTime? approvedOn;

  factory Health.fromJson(Map<String, dynamic> json) => Health(
    status: json["status"] == null ? null : json["status"],
    approvedOn: json["approved_on"] == null ? null : DateTime.parse(json["approved_on"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "approved_on": approvedOn == null ? null : approvedOn!.toIso8601String(),
  };
}

class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
    this.smallS3,
  });

  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"] == null ? null : json["raw"],
    full: json["full"] == null ? null : json["full"],
    regular: json["regular"] == null ? null : json["regular"],
    small: json["small"] == null ? null : json["small"],
    thumb: json["thumb"] == null ? null : json["thumb"],
    smallS3: json["small_s3"] == null ? null : json["small_s3"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw == null ? null : raw,
    "full": full == null ? null : full,
    "regular": regular == null ? null : regular,
    "small": small == null ? null : small,
    "thumb": thumb == null ? null : thumb,
    "small_s3": smallS3 == null ? null : smallS3,
  };
}
