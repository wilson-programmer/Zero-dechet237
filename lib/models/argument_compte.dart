// ignore_for_file: non_constant_identifier_names

class ArgumentCompte{
  String name;
  String ville;
  String prenom;

  ArgumentCompte({required this.name,required this.ville, required this.prenom} );
}

class Argument
{
  String idUser;

  Argument({required this.idUser});
}
class ArgumentCompte1{
  String name;
  String ville;
  String prenom;
  String quartier;
  String phone;


  ArgumentCompte1({required this.name,required this.ville, required this.prenom, required this.quartier, required this.phone} );
}

  class Data {
  String heure;
  int niveau;
  Data({ required this.heure, required this.niveau});


  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      heure: json['heure'],
      niveau: json['niveau'],
    );
  }
  }

  class Argu{
  String name;
  String email;
  String passe;

  Argu({required this.name,required this.email,required this.passe,} );
}

class Argus{
   String name;
  String email;
  String passe;
   String tel;
  String quartier;
  String ville;
   Argus({required this.name,required this.email,required this.passe,required this.tel,required this.ville,required this.quartier,} );
}


 class Message {
     final String message;
     final String senderId;
     final String receiverId;
     final DateTime timestamp;

     Message({
       required this.message,
       required this.senderId,
       required this.receiverId,
       required this.timestamp,
     });
   }


class ArgumentId
{
  String send;
  String receive;

  ArgumentId({required this.send, required this.receive});
}