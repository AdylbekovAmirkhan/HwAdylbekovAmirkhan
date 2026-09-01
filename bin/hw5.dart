class Book{
  String _title;
  String _author;
  double _rating = 0.0;

  Book(this._title, this._author );

  Book.withRating(this._title, this._author, this._rating) {
    rating = _rating; 
  }

  String get title => _title;
  String get author => _author;
  double get rating => _rating;

  set rating(double value) {
    if (value >= 0 && value <= 10) {
      _rating = value;
    } else {
      print("oshibka");
    }
  }

  void displayInfo() {
    print("title: $_title\nauthor: $_author\nrting: $_rating");
  }
}


