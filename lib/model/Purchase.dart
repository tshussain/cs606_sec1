

import 'Owner.dart';
import 'PetRecord.dart';

class Purchase {
  int transactionId;
  PetRecord petRecord;
  Owner owner;

  Purchase(this.transactionId, this.petRecord, this.owner);

  Purchase.generate(this.petRecord, this.owner)  {
    DateTime now = DateTime.now();
    this.transactionId = now.hashCode;
  }
}