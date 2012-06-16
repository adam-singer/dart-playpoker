List servedCards=new List();

void serveHand(int player){
for(var i = 0;i<5;i++){
  pickCard();
}
}

Card pickCard(){
  var randGenerator=new Random();
  num randomSuite = randGenerator.nextInt(4);
  num randomRank = randGenerator.nextInt(13);
  Card giveCard = new Card(randomSuite,randomRank);
  return giveCard;
}