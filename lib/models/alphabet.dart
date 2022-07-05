class Alphabet {
  final int? idd;
  final String arabicalpha;
  final String wordexample;

  Alphabet({this.idd,required this.arabicalpha,required this.wordexample});




  Map<String, Object?> toMap() {
    return {
      'idd': idd,
      'arabicalpha': arabicalpha,
      'wordexample': wordexample,
    };


  }

  static Alphabet fromMap(Map<String, Object?> json) => Alphabet(
      idd: json["IDD"] as int?,
      arabicalpha: json["ARABICALPHA"] as String,
      wordexample: json["WORDEXAMPLE"] as String
  );

}