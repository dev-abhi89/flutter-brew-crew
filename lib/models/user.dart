class UserId{
 final String uid;
 UserId({required this.uid });
}

class Userdata{
 late final String uid;
 late final String name;
 late final String suger;
 late final int strength;
 Userdata({
  required this.name,
  required this.uid,
  required this.suger,
  required this.strength
});

 Userdata.nul(){
  uid='';
  name='';
  suger = '';
  strength =0;
 }
}