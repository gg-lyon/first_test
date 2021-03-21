class NumberOutput {
  //final String output;
  final int randomNumber;
  NumberOutput({this.randomNumber});

  factory NumberOutput.fromJson(Map<String, dynamic> json) {
    return NumberOutput(
        //output: json['output'],
        randomNumber: json["random"]
    );
  }

}
