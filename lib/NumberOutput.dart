class NumberOutput {
  String output;

  NumberOutput({this.output});

  factory NumberOutput.fromJson(Map<String, dynamic> json) {
    return NumberOutput(
        output: json['output']
    );
  }

}
