
/// Class to keep track of pet information for our veterinarian records
class PetRecord {
  String _petName;
  int _petAge;

  PetRecord(this._petName, this._petAge);

  String get petName => _petName;

  int get petAge => _petAge;

  @override
  String toString() {
    return 'PetRecord{_petName: $_petName, _petAge: $_petAge}';
  }
}