final class GoogleLoginRequestModel {
  final String idToken;
  final String? email;
  final String? name;
  final String? photoUrl;

  const GoogleLoginRequestModel({
    required this.idToken,
    this.email,
    this.name,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
        'id_token': idToken,
        if (email != null) 'email': email,
        if (name != null) 'name': name,
        if (photoUrl != null) 'photo_url': photoUrl,
      };
}

