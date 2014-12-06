
#property copyright "AlexanderStrokov"
extern string Пapаметры="Параметры пробойного ордера";
extern int TPStartOrder=10;
extern int filtr=5;
extern int Magic_Number = 111;
extern int BodySize=0;
extern int CandleSize=0;
extern bool SellTrade=true;
extern bool BuyTrade=true;
extern string Пapаметры1="Уровни открытия хеджирующих ордеров";
extern int Level1=30;
extern int Level2=100;
extern int Level3=200;
extern int Level4=400;
extern int Level5=750;
extern int Level6=1000;
extern int Level7=1500;
extern int Level8=2000;
extern int Level9=2500;
extern int Level10=3000;
extern int Level11=3500;
extern int Level12=4000;
extern int Level13=4500;
extern int Level14=5000;
extern string Пapаметры2="Лоты ордеров";
extern double lot1=0.1;
extern double lot2=0.15;
extern double lot3=0.2;
extern double lot4=0.4;
extern double lot5=0.8;
extern double lot6=1.2;
extern double lot7=1.6;
extern double lot8=2.4;
extern double lot9=3;
extern double lot10=3;
extern double lot11=3;
extern double lot12=3;
extern double lot13=3;
extern double lot14=3;
extern double lot15=3;
extern string Пapаметры3="Дополнительные параметры";
extern bool DinamicLot=true;
extern int MM=35000;
extern int Lok=5;
extern int bonusTP=10;
extern int Percent=30;
extern int CriticalCoef=5;
int NextBuyOrder;
double TotlSvop;

int NextSellOrder;
int CountBuy=0;
int CountSell=0;
double TPBuyResult=0;
 double GoGoSell=1;
 double GoGoBuy=1;
double TPSellResult=0;
double TotlSwap;
int loose=0;
double NextLotB;
double NextLotS;
double StartBuyPrice;
double StartSellPrice;
double StartBuy2Price;
double StartSell2Price;
double StartBuy3Price;
double StartSell3Price;
double StartBuy4Price;
double StartSell4Price;
double StartBuy5Price;
double StartSell5Price;
double StartBuy6Price;
double StartSell6Price;
double StartBuy7Price;
double StartSell7Price;
double StartBuy8Price;
double StartSell8Price;
double StartBuy9Price;
double StartSell9Price;
double StartBuy10Price;
double StartSell10Price;
double StartBuy11Price;
double StartSell11Price;
double StartBuy12Price;
double StartSell12Price;
double StartBuy13Price;
double StartSell13Price;
double StartBuy14Price;
double StartSell14Price;
double TotalBLot;
double TotalSLot;
double TotalBLt;
double TotalSLt;
double OrderSwaps;
double TotalLoose;
bool BuTranz=false;
double Stop;
int SaveBuy;
bool OpenOrderBuy=false;
bool OpenOrderSell=false;
bool flag_sell=false,flag_buy=false;
int i;
int k;
int ReCountBuy;
int ReCountSell;

int init()
{


if((Digits==3)||(Digits==5)) { k=10;}
if((Digits==4)||(Digits==2)) { k=1;}

   return(0);
}

int deinit()
{

ObjectDelete("label_object1");
ObjectDelete("label_object2");
ObjectDelete("label_object3");
ObjectDelete("label_object4");
   return(0);
}

int start()
{                  string acc= CharToStr(49)+CharToStr(54)+CharToStr(51)+CharToStr(48)+CharToStr(53)+CharToStr(48)+CharToStr(52);
 if((AccountNumber() != acc)&&(IsDemo() == false)) { Alert("Неверный счет!");
    Sleep (6000);return(0);}
OpenOrderBuy=false;   OpenOrderSell=false; 
       for(int pos=0;pos<OrdersTotal();pos++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(pos, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&&(OrderMagicNumber() == Magic_Number )&&(OrderType()==OP_BUY)) {
    OpenOrderBuy=true;  
    }
    if (( OrderSymbol() == Symbol())&&(OrderMagicNumber() == Magic_Number )&&(OrderType()==OP_SELL)) {
    OpenOrderSell=true;  
    }
    }    
    }    
                switch(CountBuy)                                  // Заголовок switch
     {     
      case 0 : NextLotB=lot1*GoGoBuy; break;                                     // Начало тела switch
      case 1 : NextLotB=lot2*GoGoBuy; break;
      case 2 : NextLotB=lot3*GoGoBuy; break;
      case 3 : NextLotB=lot4*GoGoBuy; break;
      case 4 : NextLotB=lot5*GoGoBuy; break;
      case 5 : NextLotB=lot6*GoGoBuy; break;
      case 6 : NextLotB=lot7*GoGoBuy; break;
      case 7 : NextLotB=lot8*GoGoBuy; break;
      case 8 : NextLotB=lot9*GoGoBuy; break;
      case 9 : NextLotB=lot10*GoGoBuy;break;
      case 10 : NextLotB=lot11*GoGoBuy; break;
      case 11 : NextLotB=lot12*GoGoBuy; break;
      case 12 : NextLotB=lot13*GoGoBuy; break;
      case 13 : NextLotB=lot14*GoGoBuy; break;
      case 14 : NextLotB=lot15*GoGoBuy;break;
     }
                           switch(CountSell)                                  
     {                                            
      case 0 : NextLotS=lot1*GoGoSell; break;
      case 1 : NextLotS=lot2*GoGoSell; break;
      case 2 : NextLotS=lot3*GoGoSell; break;
      case 3 : NextLotS=lot4*GoGoSell; break;
      case 4 : NextLotS=lot5*GoGoSell; break;
      case 5 : NextLotS=lot6*GoGoSell; break;
      case 6 : NextLotS=lot7*GoGoSell; break;
      case 7 : NextLotS=lot8*GoGoSell; break;
      case 8 : NextLotS=lot9*GoGoSell; break;
      case 9 : NextLotS=lot10*GoGoSell;break;
      case 10: NextLotS=lot11*GoGoSell; break;
      case 11 : NextLotS=lot12*GoGoSell; break;
      case 12 : NextLotS=lot13*GoGoSell; break;
      case 13 : NextLotS=lot14*GoGoSell; break;
      case 14 : NextLotS=lot15*GoGoSell;break;
 
     }
    
    if (OpenOrderBuy==false)  {TotalBLot=0; NextBuyOrder=NULL; }    
    
    if (OpenOrderSell==false)  {TotalSLot=0; NextSellOrder=NULL; }

ObjectCreate("label_object1",OBJ_LABEL,0,0,0);
ObjectSet("label_object1",OBJPROP_CORNER,4);
ObjectSet("label_object1",OBJPROP_XDISTANCE,10);
ObjectSet("label_object1",OBJPROP_YDISTANCE,10);
ObjectSetText("label_object1","Количество ордеров Buy="+CountBuy+"; Торгуемый лот="+DoubleToStr(TotalBLt,2)+"; Открытие="+NextBuyOrder,12,"Arial",Red);


ObjectCreate("label_object2",OBJ_LABEL,0,0,0);
ObjectSet("label_object2",OBJPROP_CORNER,4);
ObjectSet("label_object2",OBJPROP_XDISTANCE,10);
ObjectSet("label_object2",OBJPROP_YDISTANCE,30);
ObjectSetText("label_object2","Количество ордеров Sell="+CountSell+"; Торгуемый лот="+DoubleToStr(TotalSLt,2)+"; Открытие="+NextSellOrder,12,"Arial",Red);

ObjectCreate("label_object4",OBJ_LABEL,0,0,0);
ObjectSet("label_object4",OBJPROP_CORNER,4);
ObjectSet("label_object4",OBJPROP_XDISTANCE,10);
ObjectSet("label_object4",OBJPROP_YDISTANCE,50);
ObjectSetText("label_object4","Следующий лот на покупку="+DoubleToStr(NextLotB,2)+"; Следующий лот на продажу="+DoubleToStr(NextLotS,2),12,"Arial",Green);
LabelInfo();



ObjectCreate("label_object3",OBJ_LABEL,0,0,0);
ObjectSet("label_object3",OBJPROP_CORNER,4);
ObjectSet("label_object3",OBJPROP_XDISTANCE,10);
ObjectSet("label_object3",OBJPROP_YDISTANCE,70);
ObjectSetText("label_object3","Текущий своп="+DoubleToStr(OrderSwaps,2)+"; Итоговый своп="+DoubleToStr(TotlSwap,2),12,"Arial",Green);



LabelInfo();
  OrderSwaps=0;
  
 ReCountBuy=0;ReCountSell=0;
 for(int in=0;in<OrdersTotal();in++)
   {      if(OrderSelect(in, SELECT_BY_POS)==true){ 
    if ( OrderSymbol() == Symbol()) {
if ((OrderType() == OP_BUY )&&(OrderMagicNumber() == Magic_Number )){ReCountBuy=ReCountBuy+1;}
if ((OrderType() == OP_SELL)&&(OrderMagicNumber() == Magic_Number )){ReCountSell=ReCountSell+1;}
    }}}   
if((Lok<CountBuy)&&(ReCountBuy==0)){SellSTOPDel();}   

if((Lok<CountSell)&&(ReCountSell==0)){BuySTOPDel();}   
  
  
  
  
  
  
  
  //Проверка открытых ордеров, запоминание первых, контроль лимитных ордеров
 CountBuy=0;CountSell=0;TotalSLt=0;TotalBLt=0;
  for(int q=0;q<OrdersTotal();q++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )) {
if (OrderType() == OP_BUY ){CountBuy=CountBuy+1;if (OrderComment()=="11"){StartBuyPrice=OrderOpenPrice();GoGoBuy=OrderLots()/lot1;TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="12"){StartBuy2Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="14"){StartBuy4Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="15"){StartBuy5Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="16"){StartBuy6Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="17"){StartBuy7Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="18"){StartBuy8Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="19"){StartBuy9Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="110"){StartBuy10Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="111"){StartBuy11Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="112"){StartBuy12Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="113"){StartBuy13Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="114"){StartBuy14Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}if (OrderComment()=="13"){StartBuy3Price=OrderOpenPrice();TotalBLt=TotalBLt+OrderLots();}}
if (OrderType() == OP_SELL ){CountSell=CountSell+1;if (OrderComment()=="21"){StartSellPrice=OrderOpenPrice();GoGoSell=OrderLots()/lot1;TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="22"){StartSell2Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="24"){StartSell4Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="25"){StartSell5Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="26"){StartSell6Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="27"){StartSell7Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="28"){StartSell8Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="29"){StartSell9Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="210"){StartSell10Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="211"){StartSell11Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="212"){StartSell12Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="213"){StartSell13Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="214"){StartSell14Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}if (OrderComment()=="23"){StartSell3Price=OrderOpenPrice();TotalSLt=TotalSLt+OrderLots();}}
if ((OrderType() == OP_SELL )||(OrderType() == OP_BUY )){OrderSwaps=OrderSwaps+OrderSwap();}
    }}}    
     
//Ожидание второго ордера на покупку
if ((CountBuy==1)&&(Ask<(StartBuyPrice-Level1*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 2-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot2,Ask,3*k,NULL,TPBuyResult,"12",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
    
        for(int qq=0;qq<OrdersTotal();qq++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(qq, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="12")) {
if (OrderType() == OP_BUY ){
RefreshRates();
   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание второго ордера на продажу
 
if ((CountSell==1)&&(Bid>(StartSellPrice+Level1*k*Point))&&(StartSellPrice!=0)) {
LooseNowSell();
Print ("Открытие 2-го ордера");
 
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot2,Bid,3*k,NULL,TPSellResult,"22",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
 
        for(int qqq=0;qqq<OrdersTotal();qqq++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(qqq, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="22")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}
 


//Ожидание третьего ордера на покупку
if ((CountBuy==2)&&(Ask<(StartBuyPrice-Level2*k*Point))&&(StartBuyPrice!=0)) {

LooseNowBuy();
Print ("Открытие 3-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot3,Ask,4*k,NULL,TPBuyResult,"13",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q2=0;q2<OrdersTotal();q2++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q2, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="13")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание третьего ордера на продажу
 
if ((CountSell==2)&&(Bid>(StartSellPrice+Level2*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 3-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot3,Bid,3*k,NULL,TPSellResult,"23",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q3=0;q3<OrdersTotal();q3++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q3, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="23")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
} 
 
 
 
 //Ожидание четвертого ордера на покупку
if ((CountBuy==3)&&(Ask<(StartBuyPrice-Level3*k*Point))&&(StartBuyPrice!=0)) {
 LooseNowBuy();
 Print ("Открытие 4-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot4,Ask,3*k,NULL,TPBuyResult,"14",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
     
        for(int q4=0;q4<OrdersTotal();q4++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q4, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="14")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание четвертого ордера на продажу
 
if ((CountSell==3)&&(Bid>(StartSellPrice+Level3*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 4-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot4,Bid,3*k,NULL,TPSellResult,"24",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q5=0;q5<OrdersTotal();q5++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q5, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="24")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
} 
 
 
  //Ожидание пятого ордера на покупку
if ((CountBuy==4)&&(Ask<(StartBuyPrice-Level4*k*Point))&&(StartBuyPrice!=0)) {
 LooseNowBuy();
 Print ("Открытие 5-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot5,Ask,3*k,NULL,TPBuyResult,"15",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
     
        for(int q6=0;q6<OrdersTotal();q6++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q6, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="15")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание пятого ордера на продажу
 
if ((CountSell==4)&&(Bid>(StartSellPrice+Level4*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 5-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot5,Bid,3*k,NULL,TPSellResult,"25",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q7=0;q7<OrdersTotal();q7++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q7, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="25")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
} 
 
 
 
   //Ожидание шестого ордера на покупку
if ((CountBuy==5)&&(Ask<(StartBuyPrice-Level5*k*Point))&&(StartBuyPrice!=0)) {
 LooseNowBuy();
 Print ("Открытие 6-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot6,Ask,3*k,NULL,TPBuyResult,"16",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {

        for(int q8=0;q8<OrdersTotal();q8++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q8, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="16")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание шестого ордера на продажу
 
if ((CountSell==5)&&(Bid>(StartSellPrice+Level5*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 6-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot6,Bid,3*k,NULL,TPSellResult,"26",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q9=0;q9<OrdersTotal();q9++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q9, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="26")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
} 
 
 
   //Ожидание седьмого ордера на покупку
if ((CountBuy==6)&&(Ask<(StartBuyPrice-Level6*k*Point))&&(StartBuyPrice!=0)) {
 LooseNowBuy();
 Print ("Открытие 7-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot7,Ask,3*k,NULL,TPBuyResult,"17",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q10=0;q10<OrdersTotal();q10++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q10, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="17")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание седьмого ордера на продажу
 
if ((CountSell==6)&&(Bid>(StartSellPrice+Level6*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 7-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot7,Bid,3*k,NULL,TPSellResult,"27",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q11=0;q11<OrdersTotal();q11++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q11, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="27")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
} 
 
   //Ожидание восьмого ордера на покупку
if ((CountBuy==7)&&(Ask<(StartBuyPrice-Level7*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 8-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot8,Ask,3*k,NULL,TPBuyResult,"18",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q12=0;q12<OrdersTotal();q12++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q12, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="18")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание восьмого ордера на продажу
 
if ((CountSell==7)&&(Bid>(StartSellPrice+Level7*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 8-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot8,Bid,3*k,NULL,TPSellResult,"28",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q13=0;q13<OrdersTotal();q13++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q13, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="28")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}  
 
 
 
 
 
 
 
 
    //Ожидание девятого ордера на покупку
if ((CountBuy==8)&&(Ask<(StartBuyPrice-Level8*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 9-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot9,Ask,3*k,NULL,TPBuyResult,"19",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q122=0;q122<OrdersTotal();q122++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q122, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="19")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание девятого ордера на продажу
 
if ((CountSell==8)&&(Bid>(StartSellPrice+Level8*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 9-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot9,Bid,3*k,NULL,TPSellResult,"29",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q135=0;q135<OrdersTotal();q135++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q135, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="29")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}  
 
     //Ожидание десятого ордера на покупку
if ((CountBuy==9)&&(Ask<(StartBuyPrice-Level9*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 10-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot10,Ask,3*k,NULL,TPBuyResult,"110",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q1122=0;q1122<OrdersTotal();q1122++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q1122, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="110")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание десятого ордера на продажу
 
if ((CountSell==9)&&(Bid>(StartSellPrice+Level9*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 10-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot10,Bid,3*k,NULL,TPSellResult,"210",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q1235=0;q1235<OrdersTotal();q1235++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q1235, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="210")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}  
 
      
     //Ожидание одиннадцатого ордера на покупку
if ((CountBuy==10)&&(Ask<(StartBuyPrice-Level10*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 11-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot11,Ask,3*k,NULL,TPBuyResult,"111",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q11222=0;q11222<OrdersTotal();q11222++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q11222, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="111")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание одиннадцатого ордера на продажу
 
if ((CountSell==10)&&(Bid>(StartSellPrice+Level10*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 11-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot11,Bid,3*k,NULL,TPSellResult,"211",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q12235=0;q12235<OrdersTotal();q12235++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q12235, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="211")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}  


     //Ожидание двенадцатого ордера на покупку
if ((CountBuy==11)&&(Ask<(StartBuyPrice-Level11*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 12-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot12,Ask,3*k,NULL,TPBuyResult,"112",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q11223=0;q11223<OrdersTotal();q11223++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q11223, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="112")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание двенадцатого ордера на продажу
 
if ((CountSell==11)&&(Bid>(StartSellPrice+Level11*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 12-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot12,Bid,3*k,NULL,TPSellResult,"212",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q12355=0;q12355<OrdersTotal();q12355++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q12355, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="212")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}    
    
    
       //Ожидание тринадцатого ордера на покупку
if ((CountBuy==12)&&(Ask<(StartBuyPrice-Level12*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 13-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot13,Ask,3*k,NULL,TPBuyResult,"113",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q21122=0;q21122<OrdersTotal();q21122++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q21122, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="113")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание тринадцатого ордера на продажу
 
if ((CountSell==12)&&(Bid>(StartSellPrice+Level12*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 13-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot13,Bid,3*k,NULL,TPSellResult,"213",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q17235=0;q17235<OrdersTotal();q17235++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q17235, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="213")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}  
 
      
     //Ожидание четырнадцатого ордера на покупку
if ((CountBuy==13)&&(Ask<(StartBuyPrice-Level13*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
Print ("Открытие 14-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot14,Ask,3*k,NULL,TPBuyResult,"114",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q112229=0;q112229<OrdersTotal();q112229++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q112229, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="114")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание четырнадцатого ордера на продажу
 
if ((CountSell==13)&&(Bid>(StartSellPrice+Level13*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 14-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot14,Bid,3*k,NULL,TPSellResult,"214",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q1223512=0;q12235<OrdersTotal();q1223512++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q1223512, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="214")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}  


     //Ожидание пятнадцатого ордера на покупку
if ((CountBuy==14)&&(Ask<(StartBuyPrice-Level14*k*Point))&&(StartBuyPrice!=0)) {
LooseNowBuy();
 Print ("Открытие 15-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUY,GoGoBuy*lot15,Ask,3*k,NULL,TPBuyResult,"115",Magic_Number,0,Blue) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q151223=0;q151223<OrdersTotal();q151223++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
      if(OrderSelect(q151223, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="115")) {
if (OrderType() == OP_BUY ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPBuyResult,0,Blue); }
    }}} }
      }
}
 
 //Ожидание пятнадцатого ордера на продажу
 
if ((CountSell==14)&&(Bid>(StartSellPrice+Level14*k*Point))&&(StartSellPrice!=0)) {

LooseNowSell();
Print ("Открытие 15-го ордера");
 if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELL,GoGoSell*lot15,Bid,3*k,NULL,TPSellResult,"215",Magic_Number,0,Red) < 0) 
      { 
        Alert("Ошибка открытия позиции № ", GetLastError()); 
      } 
      else
      {
      
        for(int q512355=0;q512355<OrdersTotal();q512355++)
   {
      // результат выбора проверки, так как ордер может быть закрыт или удален в это время!
	  ;
      if(OrderSelect(q512355, SELECT_BY_POS)==true){ 
    if (( OrderSymbol() == Symbol())&& (OrderMagicNumber() == Magic_Number )&&(OrderComment()!="215")) {
if (OrderType() == OP_SELL ){   OrderModify(OrderTicket(),OrderOpenPrice(),OrderStopLoss(),TPSellResult,0,Blue); }
    }}} }
      }
}     
  if(!isNewBar())return(0);

  if (TimeHour(TimeCurrent())==00){
  
  TotlSwap=0;
for (int q1=OrdersHistoryTotal()-1; q1>=0; q1--){
if (OrderSelect(q1, SELECT_BY_POS, MODE_HISTORY)) {

       if (((OrderType()==OP_SELL)||(OrderType()==OP_BUY))&&(OrderMagicNumber()==Magic_Number)){
     TotlSwap=TotlSwap+OrderSwap();   }}}
       
      
     }
   
     for (int i=OrdersTotal()-1; i>=0; i--)
   {
      if (!OrderSelect(i,SELECT_BY_POS,MODE_TRADES)) break;
            if ((OrderType()==OP_BUYSTOP  )&&(OrderMagicNumber() == Magic_Number ))    if (IsTradeAllowed()) { if (OrderDelete(OrderTicket())<0) 
            { 
        Alert("Ошибка удаления ордера № ", GetLastError()); 
      }  
            }
      if ((OrderType()==OP_SELLSTOP )&&(OrderMagicNumber() == Magic_Number )) if (IsTradeAllowed()){if (OrderDelete(OrderTicket())<0)
           { 
        Alert("Ошибка удаления ордера № ", GetLastError()); 
      } 
      }
         }

    //++++++++++++++++++++Размещение первого ордера+++++++++++++++++++++++++++++
  if ((OpenOrderSell==false)&&((((Close[1]-Open[1])>BodySize*k*Point)&&((High[1]-Low[1])>CandleSize*k*Point))||(CountBuy>Lok))&&(SellTrade==true))
    {    
   if(OpenOrderBuy==false){ GoGoSell=1;}
if (CountBuy>Lok){
if (TotalBLt!=0){GoGoSell=TotalBLt*Percent/100/lot1; if (GoGoSell<(AccountEquity()/MM)) {GoGoSell=AccountEquity()/MM;}}
                 }
if (GoGoSell<1) {GoGoSell=1;} if (GoGoSell>CriticalCoef){GoGoSell=CriticalCoef;}
if ((CountBuy==0)&&(CountSell==0)&&(DinamicLot==true)){Print("Рассчёт начального ордера");GoGoSell=AccountEquity()/MM;}
Print ("Открытие 1-го ордера");
Sleep(2000);
if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_SELLSTOP,lot1*GoGoSell,Low[1]-filtr*k*Point,3*k,NULL,Low[1]-filtr*k*Point-TPStartOrder*k*Point,"21",Magic_Number,0,Red) < 0) 
{ 
Alert("Ошибка открытия позиции № ", GetLastError()); 
}}}
if ((OpenOrderBuy==false)&&((((Open[1]-Close[1])>BodySize*k*Point)&&((High[1]-Low[1])>CandleSize*k*Point))||(CountSell>Lok))&&(BuyTrade==true)) {
if(OpenOrderSell==false){ GoGoBuy=1;}
if (CountSell>Lok){
if (TotalSLt!=0){ GoGoBuy=TotalSLt*Percent/100/lot1; if (GoGoBuy<(AccountEquity()/MM)) {GoGoBuy=AccountEquity()/MM;} }
                  }
if (GoGoBuy<1) {GoGoBuy=1;}if (GoGoBuy>CriticalCoef){GoGoBuy=CriticalCoef;}
if ((CountBuy==0)&&(CountSell==0)&&(DinamicLot==true)){Print("Рассчёт начального ордера");GoGoBuy=AccountEquity()/MM;}
Sleep(2000);
Print ("Открытие 1-го ордера");
if (IsTradeAllowed()) { if(    OrderSend(Symbol(),OP_BUYSTOP,lot1*GoGoBuy,High[1]+filtr*k*Point,3*k,NULL,High[1]+filtr*k*Point+TPStartOrder*k*Point,"11",Magic_Number,0,Blue) < 0) 
      {Alert("Ошибка открытия позиции № ", GetLastError()); }}
      }

  if(
  Orders_Total_by_type(OP_BUY, Magic_Number, Symbol()) > 0)
 if(
 Orders_Total_by_type(OP_SELL, Magic_Number, Symbol()) > 0)
   return(0);
  }
   
 bool LabelInfo()
  { if (CountBuy==1){NextBuyOrder=(Ask-(StartBuyPrice-Level1*k*Point))*10000;}
  if (CountBuy==2){NextBuyOrder=(Ask-(StartBuyPrice-Level2*k*Point))*10000;}
  if (CountBuy==3){NextBuyOrder=(Ask-(StartBuyPrice-Level3*k*Point))*10000;}
  if (CountBuy==4){NextBuyOrder=(Ask-(StartBuyPrice-Level4*k*Point))*10000;}
  if (CountBuy==5){NextBuyOrder=(Ask-(StartBuyPrice-Level5*k*Point))*10000;}
  if (CountBuy==6){NextBuyOrder=(Ask-(StartBuyPrice-Level6*k*Point))*10000;}
  if (CountBuy==7){NextBuyOrder=(Ask-(StartBuyPrice-Level7*k*Point))*10000;}
  if (CountBuy==8){NextBuyOrder=(Ask-(StartBuyPrice-Level8*k*Point))*10000;}
  if (CountBuy==9){NextBuyOrder=(Ask-(StartBuyPrice-Level9*k*Point))*10000;}
   if (CountBuy==10){NextBuyOrder=(Ask-(StartBuyPrice-Level10*k*Point))*10000;}
  if (CountBuy==11){NextBuyOrder=(Ask-(StartBuyPrice-Level11*k*Point))*10000;}
  if (CountBuy==12){NextBuyOrder=(Ask-(StartBuyPrice-Level12*k*Point))*10000;}
   if (CountBuy==13){NextBuyOrder=(Ask-(StartBuyPrice-Level13*k*Point))*10000;}
  if (CountBuy==14){NextBuyOrder=(Ask-(StartBuyPrice-Level14*k*Point))*10000;}
  
  if (CountSell==1){NextSellOrder=((StartSellPrice+Level1*k*Point)-Bid)*10000;}
  if (CountSell==2){NextSellOrder=((StartSellPrice+Level2*k*Point)-Bid)*10000;}
  if (CountSell==3){NextSellOrder=((StartSellPrice+Level3*k*Point)-Bid)*10000;}
  if (CountSell==4){NextSellOrder=((StartSellPrice+Level4*k*Point)-Bid)*10000;}
  if (CountSell==5){NextSellOrder=((StartSellPrice+Level5*k*Point)-Bid)*10000;}
  if (CountSell==6){NextSellOrder=((StartSellPrice+Level6*k*Point)-Bid)*10000;}
  if (CountSell==7){NextSellOrder=((StartSellPrice+Level7*k*Point)-Bid)*10000;}
  if (CountSell==8){NextSellOrder=((StartSellPrice+Level8*k*Point)-Bid)*10000;}
  if (CountSell==9){NextSellOrder=((StartSellPrice+Level9*k*Point)-Bid)*10000;}
  if (CountSell==10){NextSellOrder=((StartSellPrice+Level10*k*Point)-Bid)*10000;}
  if (CountSell==11){NextSellOrder=((StartSellPrice+Level11*k*Point)-Bid)*10000;}
   if (CountSell==12){NextSellOrder=((StartSellPrice+Level12*k*Point)-Bid)*10000;}
  if (CountSell==13){NextSellOrder=((StartSellPrice+Level13*k*Point)-Bid)*10000;}
  if (CountSell==14){NextSellOrder=((StartSellPrice+Level14*k*Point)-Bid)*10000;}
  
  
  }
  
double LooseNowSell()
{  
if (CountSell==14){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell+(Bid-StartSell8Price)*lot8*GoGoSell+(Bid-StartSell9Price)*lot9*GoGoSell+(Bid-StartSell10Price)*lot10*GoGoSell+(Bid-StartSell11Price)*lot11*GoGoSell+(Bid-StartSell12Price)*lot12*GoGoSell+(Bid-StartSell13Price)*lot13*GoGoSell+(Bid-StartSell14Price)*lot14*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell+lot9*GoGoSell+lot10*GoGoSell+lot11*GoGoSell+lot12*GoGoSell+lot13*GoGoSell+lot14*GoGoSell+lot15*GoGoSell;} 
if (CountSell==13){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell+(Bid-StartSell8Price)*lot8*GoGoSell+(Bid-StartSell9Price)*lot9*GoGoSell+(Bid-StartSell10Price)*lot10*GoGoSell+(Bid-StartSell11Price)*lot11*GoGoSell+(Bid-StartSell12Price)*lot12*GoGoSell+(Bid-StartSell13Price)*lot13*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell+lot9*GoGoSell+lot10*GoGoSell+lot11*GoGoSell+lot12*GoGoSell+lot13*GoGoSell+lot14*GoGoSell;} 
if (CountSell==12){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell+(Bid-StartSell8Price)*lot8*GoGoSell+(Bid-StartSell9Price)*lot9*GoGoSell+(Bid-StartSell10Price)*lot10*GoGoSell+(Bid-StartSell11Price)*lot11*GoGoSell+(Bid-StartSell12Price)*lot12*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell+lot9*GoGoSell+lot10*GoGoSell+lot11*GoGoSell+lot12*GoGoSell+lot13*GoGoSell;} 
if (CountSell==11){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell+(Bid-StartSell8Price)*lot8*GoGoSell+(Bid-StartSell9Price)*lot9*GoGoSell+(Bid-StartSell10Price)*lot10*GoGoSell+(Bid-StartSell11Price)*lot11*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell+lot9*GoGoSell+lot10*GoGoSell+lot11*GoGoSell+lot12*GoGoSell;} 
if (CountSell==10){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell+(Bid-StartSell8Price)*lot8*GoGoSell+(Bid-StartSell9Price)*lot9*GoGoSell+(Bid-StartSell10Price)*lot10*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell+lot9*GoGoSell+lot10*GoGoSell+lot11*GoGoSell;}  
if (CountSell==9){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell+(Bid-StartSell8Price)*lot8*GoGoSell+(Bid-StartSell9Price)*lot9*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell+lot9*GoGoSell+lot10*GoGoSell;} 
 if (CountSell==8){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell+(Bid-StartSell8Price)*lot8*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell+lot9*GoGoSell;} 
    if (CountSell==7){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell+(Bid-StartSell7Price)*lot7*GoGoSell; TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell+lot8*GoGoSell;}
    if (CountSell==6){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell+(Bid-StartSell6Price)*lot6*GoGoSell;  TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell+lot7*GoGoSell;  }
     if (CountSell==5){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell+(Bid-StartSell5Price)*lot5*GoGoSell;TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell+lot6*GoGoSell;}
        if (CountSell==4){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell+(Bid-StartSell4Price)*lot4*GoGoSell;TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell+lot5*GoGoSell;}
        if (CountSell==3){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell+(Bid-StartSell3Price)*lot3*GoGoSell;TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell+lot4*GoGoSell;}
        if (CountSell==2){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell+(Bid-StartSell2Price)*lot2*GoGoSell;TotalSLot=lot1*GoGoSell+lot2*GoGoSell+lot3*GoGoSell;}
    if (CountSell==1){TotalLoose=(Bid-StartSellPrice)*lot1*GoGoSell;TotalSLot=lot1*GoGoSell+lot2*GoGoSell;}
 for (int c=10;c<50000;c++){
if ((TotalSLot*c*Point)>TotalLoose){ TPSellResult=Bid-c*Point-bonusTP*k*Point; break;} 

    } 
    return(TPSellResult);
    }
    double LooseNowBuy(){
     if (CountBuy==14){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy+(StartBuy8Price-Ask)*lot8*GoGoBuy+(StartBuy9Price-Ask)*lot9*GoGoBuy+(StartBuy10Price-Ask)*lot10*GoGoBuy+(StartBuy11Price-Ask)*lot11*GoGoBuy+(StartBuy12Price-Ask)*lot12*GoGoBuy+(StartBuy13Price-Ask)*lot13*GoGoBuy+(StartBuy14Price-Ask)*lot14*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy+lot9*GoGoBuy+lot10*GoGoBuy+lot11*GoGoBuy+lot12*GoGoBuy+lot13*GoGoBuy+lot14*GoGoBuy+lot15*GoGoBuy;}
     if (CountBuy==13){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy+(StartBuy8Price-Ask)*lot8*GoGoBuy+(StartBuy9Price-Ask)*lot9*GoGoBuy+(StartBuy10Price-Ask)*lot10*GoGoBuy+(StartBuy11Price-Ask)*lot11*GoGoBuy+(StartBuy12Price-Ask)*lot12*GoGoBuy+(StartBuy13Price-Ask)*lot13*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy+lot9*GoGoBuy+lot10*GoGoBuy+lot11*GoGoBuy+lot12*GoGoBuy+lot13*GoGoBuy+lot14*GoGoBuy;}
    if (CountBuy==12){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy+(StartBuy8Price-Ask)*lot8*GoGoBuy+(StartBuy9Price-Ask)*lot9*GoGoBuy+(StartBuy10Price-Ask)*lot10*GoGoBuy+(StartBuy11Price-Ask)*lot11*GoGoBuy+(StartBuy12Price-Ask)*lot12*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy+lot9*GoGoBuy+lot10*GoGoBuy+lot11*GoGoBuy+lot12*GoGoBuy+lot13*GoGoBuy;}
     if (CountBuy==11){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy+(StartBuy8Price-Ask)*lot8*GoGoBuy+(StartBuy9Price-Ask)*lot9*GoGoBuy+(StartBuy10Price-Ask)*lot10*GoGoBuy+(StartBuy11Price-Ask)*lot11*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy+lot9*GoGoBuy+lot10*GoGoBuy+lot11*GoGoBuy+lot12*GoGoBuy;}
     if (CountBuy==10){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy+(StartBuy8Price-Ask)*lot8*GoGoBuy+(StartBuy9Price-Ask)*lot9*GoGoBuy+(StartBuy10Price-Ask)*lot10*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy+lot9*GoGoBuy+lot10*GoGoBuy+lot11*GoGoBuy;}
     if (CountBuy==9){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy+(StartBuy8Price-Ask)*lot8*GoGoBuy+(StartBuy9Price-Ask)*lot9*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy+lot9*GoGoBuy+lot10*GoGoBuy;}
    if (CountBuy==8){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy+(StartBuy8Price-Ask)*lot8*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy+lot9*GoGoBuy;}
    if (CountBuy==7){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy+(StartBuy7Price-Ask)*lot7*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy+lot8*GoGoBuy;}
    if (CountBuy==6){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy+(StartBuy6Price-Ask)*lot6*GoGoBuy; TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy+lot7*GoGoBuy;}
if (CountBuy==5){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy+(StartBuy5Price-Ask)*lot5*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy+lot6*GoGoBuy;}
if (CountBuy==4){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy+(StartBuy4Price-Ask)*lot4*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy+lot5*GoGoBuy;}
if (CountBuy==3){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy+(StartBuy3Price-Ask)*lot3*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy+lot4*GoGoBuy;}
if (CountBuy==2){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy+(StartBuy2Price-Ask)*lot2*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy+lot3*GoGoBuy;}
if (CountBuy==1){TotalLoose=(StartBuyPrice-Ask)*lot1*GoGoBuy;TotalBLot=lot1*GoGoBuy+lot2*GoGoBuy;}

for (int b=10;b<50000;b++){

if ((TotalBLot*b*Point)>TotalLoose){TPBuyResult=Ask+b*Point+bonusTP*k*Point; break;}


    }
return(TPBuyResult);

}

double BuySTOPDel()
{for (int iDel1=OrdersTotal()-1; iDel1>=0; iDel1--)
   {
      if (!OrderSelect(iDel1,SELECT_BY_POS,MODE_TRADES)) break;
            if ((OrderType()==OP_BUYSTOP)&&(OrderMagicNumber() == Magic_Number ))    if (IsTradeAllowed()) { if (OrderDelete(OrderTicket())<0) 
            { 
        Alert("Ошибка удаления ордера № ", GetLastError()); 
      }  
            }
} return(Magic_Number);}

double SellSTOPDel()
{for (int iDel2=OrdersTotal()-1; iDel2>=0; iDel2--)
   {
      if (!OrderSelect(iDel2,SELECT_BY_POS,MODE_TRADES)) break;
            if ((OrderType()==OP_SELLSTOP)&&(OrderMagicNumber() == Magic_Number ))    if (IsTradeAllowed()) { if (OrderDelete(OrderTicket())<0) 
            { 
        Alert("Ошибка удаления ордера № ", GetLastError()); 
      }  
            }
} return(Magic_Number);}
bool isNewBar()
  {
  static datetime BarTime;  
   bool res=false;
    
   if (BarTime!=Time[0]) 
      {
         BarTime=Time[0];  
         res=true;
      } 
   return(res);
  }
  
//---- Возвращает количество ордеров указанного типа ордеров ----//
int Orders_Total_by_type(int type, int mn, string sym)
{
   int num_orders=0;
   for(int i= OrdersTotal()-1;i>=0;i--)
   {
      OrderSelect(i,SELECT_BY_POS,MODE_TRADES);
      if(OrderMagicNumber() == mn && type == OrderType() && sym==OrderSymbol())
         num_orders++;
   }
   return(num_orders);
}
//if(IsDemo() == false)