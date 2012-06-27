class Hand {

    num player;
    String hand;
    Card slot1,slot2,slot3,slot4,slot5;
    /*
      Nasty workaround
    */
    static String notInDeck = '';
    
    serveHand(){
      List servedCards=new List();
      List servedPlainCards =  new List();

      while(servedCards.length<5){
        Card receivedCard = pickCard();
        if(servedPlainCards.indexOf('${receivedCard.s},${receivedCard.r}')==-1 && !notInDeck.contains('${receivedCard.s},${receivedCard.r}|')){
          servedPlainCards.add('${receivedCard.s},${receivedCard.r}');
          servedCards.add(receivedCard);
          notInDeck='$notInDeck''${receivedCard.s},${receivedCard.r}|';
          }
        }
      this.slot1=servedCards[0];
      this.slot2=servedCards[1];
      this.slot3=servedCards[2];
      this.slot4=servedCards[3];
      this.slot5=servedCards[4];
      fdb(notInDeck);
    }

    Card pickCard(){
      int  randomSuite, randomRank;
      var rnd;
      rnd = new Date.now();
      randomSuite = ((rnd.millisecondsSinceEpoch/(Math.random())).toInt()) %4;
      while(true){
        rnd = new Date.now();
        randomRank = ((rnd.millisecondsSinceEpoch/(Math.random())).toInt()) %14;
        if(randomRank!=0){break;}
      }
      Card giveCard = new Card(randomSuite,randomRank);
      return giveCard;
    }
    
    lay(){
    String slotImgPrefix,cardImgPrefix;
    fdb('laying cards for player ${this.player}');
    if(player==1){
      slotImgPrefix='h';
      }
    else
    {
      slotImgPrefix='c';
     }
   
     String generateCardImgPath(Card whichCard){
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
     String cardImgPath='cards/$cardImgPrefix${whichCard.r}\.png';
     return cardImgPath;
     }
     
    document.query('#$slotImgPrefix\1').src=generateCardImgPath(this.slot1);  
    document.query('#$slotImgPrefix\2').src=generateCardImgPath(this.slot2);
    document.query('#$slotImgPrefix\3').src=generateCardImgPath(this.slot3);
    document.query('#$slotImgPrefix\4').src=generateCardImgPath(this.slot4);
    document.query('#$slotImgPrefix\5').src=generateCardImgPath(this.slot5);
  }
  
  String evaluate(){
    Map cardsMultiplicity = new Map();
    List allSlots = [this.slot1.r,this.slot2.r,this.slot3.r,this.slot4.r,this.slot5.r];
    List listCardsMultiplicity = [];
    String stringCardsMultiplicity ='';
    
    fdb('Starting hand eval...');
    
    for (var x = 0; x<allSlots.length; x++) {
      if(cardsMultiplicity[allSlots[x]] == null){
        //Create
        cardsMultiplicity[allSlots[x]]=1;
      }else{
        //Update
        cardsMultiplicity[allSlots[x]]++;
      }
    }

    cardsMultiplicity.forEach((k,v) => listCardsMultiplicity.add(v));
    listCardsMultiplicity.sort(compare(a,b) {
      if (a == b) {
        return 0;
      } else if (a > b) {
        return 1;
      } else {
        return -1;
      }
    });
  
  for(var y = 0; y<listCardsMultiplicity.length;y++){
    stringCardsMultiplicity='$stringCardsMultiplicity''${listCardsMultiplicity[y]}';
  }    
  
  fdb('Encoded multiplicity: $stringCardsMultiplicity');
  
  //Actual logic:
  switch(stringCardsMultiplicity){
    case '11111':
      //this.hand='high card OR straight OR flush OR straight flush';
      this.allOnes();
      break;
    case '1112':
      this.hand='Pair';
      break;
    case '113':
      this.hand='Three of a kind';
      break;
    case '122':
      this.hand='Two pairs';
      break;
    case '23':
      this.hand='Fullhouse';
      break;
    case '14':
      this.hand='Four of a kind';
      break;
  }
  
  updateStatus(this.player,this.hand);
  return this.hand;
  }
 
  void allOnes(){
    List tmp=[this.slot1.r,this.slot2.r,this.slot3.r,this.slot4.r,this.slot5.r];
    tmp.sort(compare(a,b) {
      if (a == b) {
        return 0;
      } else if (a > b) {
        return 1;
      } else {
        return -1;
      }
    });
  
  if(tmp[4]==tmp[0]+4){
    if(this.isFlush()==true){
      this.hand='Straight Flush';
      }else{
    this.hand='Straight';}
    }
  else if (tmp[0]==1 && tmp[1]==10 && tmp[4]==13){
    if(this.isFlush()==true){
      this.hand='Straight Flush';
      }else{
    this.hand='Straight';
    }
    }
  

  else {
    if (this.isFlush()==true){
      this.hand='Flush';
      
    }
    else{
    this.hand='High card';
    }
  }
  
  }
  
  bool isFlush(){
    if(this.slot1.s==this.slot2.s){
      if(this.slot2.s==this.slot3.s){
        if(this.slot3.s==this.slot4.s){
          if(this.slot4.s==this.slot5.s){
            return true;
            }else{
              return false;}
          }else{return false;}
        }else{return false;}
      }else{return false;}
  }
  
  void sort(){}

  int compare(Hand opponent){}
}
