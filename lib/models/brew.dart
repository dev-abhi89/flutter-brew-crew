

class Brew{
  late String name;
 late String sugar;
 late int strength;
  Brew({required this.name,required this.strength,required this.sugar});
  Brew.N(){
    name='';
    sugar='';
    strength=0;
  }
}