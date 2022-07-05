class User {
 final int? idd;
 final String namee;
 final String email;
 final String password;
 final String birthdate;


 const User({this.idd,required this.namee,required this.email,required this.password,required this.birthdate});

 Map<String, Object?> toMap() {
  return {
   'idd': idd,
   'namee': namee,
   'email':email,
   'password':password,
   'birthdate':birthdate
  };


 }

 static User fromMap(Map<String, Object?> json) => User(
     idd: json["IDD"] as int?,
     namee: json["NAMEE"] as String,
     email: json["EMAIL"] as String,
     password: json["PASSWORD"] as String,
     birthdate: json["BIRTHDATE"] as String

 );

}



