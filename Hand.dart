class Hand {
  num player;
  Card slot1,slot2,slot3,slot4,slot5;
  Hand(this.player,this.slot1,this.slot2,this.slot3,this.slot4,this.slot5){fdb('Hand instance created for player $player');}
  lay(){
    String slotImgPrefix,cardImgPrefix;
    fdb('laying cards for player $player');
    if(player==1){
       slotImgPrefix='h';
      }
    else
    {
      slotImgPrefix='c';
     }
   
     String generateCardImgPath(Card whichCard){
       fdb('generating path for ${whichCard.nameOfCard()}');
     switch(whichCard.s){
       case 0:
         cardImgPrefix='c';
         break;
       case 1:
         cardImgPrefix='d';
         break;
       case 2:
         cardImgPrefix='h';
         break;
       case 3:
         cardImgPrefix='s';
         break;
     }  
     String cardImgPath='cards/$cardImgPrefix${whichCard.r+1}\.png';
     fdb('Path generated: $cardImgPath');
     return cardImgPath;
     }
     
    
      
document.query('#$slotImgPrefix\1').src=generateCardImgPath(this.slot1);  
document.query('#$slotImgPrefix\2').src=generateCardImgPath(this.slot2);
document.query('#$slotImgPrefix\3').src=generateCardImgPath(this.slot3);
document.query('#$slotImgPrefix\4').src=generateCardImgPath(this.slot4);
document.query('#$slotImgPrefix\5').src=generateCardImgPath(this.slot5);
  }
}
