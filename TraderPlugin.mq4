//+------------------------------------------------------------------+
//|                                                       Trader.mq5 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"

void OnStart()
  {
   string cookie=NULL,headers;
   char result[];
   int res;
   string url="http://hackathon.ftf.fund/data.php";
   ResetLastError();
   int timeout=5000;
  int i;
  int ordersHistoryAmount  = OrdersHistoryTotal();
  int accountId = AccountNumber(); 
  Print("ordersTotalAmount: " + ordersHistoryAmount);
  string requestHistoryRaw = "history=";
  for (i=16; i < ordersHistoryAmount; i++) {
     if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY)==false)
      {
         Print("Ошибка при доступе к исторической базе (",GetLastError(),")");
         break;
      }
     else {
         OrderPrint();
         int orderTypeInt = OrderType();
         if (orderTypeInt < 2){  
         
            string orderType = (orderTypeInt == 1) ? "short" : "long"; 
            int orderId               = OrderTicket();
            double orderValue         = OrderLots();
            double orderOpenPrice     = OrderOpenPrice();
            double orderClosePrice    = OrderClosePrice();
            string orderSymbol        = OrderSymbol();
            string orderOpenTime      = OrderOpenTime();
            string orderCloseTime     = OrderCloseTime();
            double accountBalance     = AccountBalance();
            double orderValueProcent  = ((orderValue*orderOpenPrice)/accountBalance)*100;
            double orderProfit        = (OrderProfit() + OrderCommission());
            double orderProfitProcent = orderProfit/(orderValue * orderOpenPrice);
            
            requestHistoryRaw +=  "xxx" + orderId + "www" +
                           ",orderId:" + orderId +
                           ",orderType:" + orderType +
                           ",orderOpenPrice:" + orderOpenPrice +
                           ",orderClosePrice:" + orderClosePrice +
                           ",orderSymbol:" + orderSymbol +
                           ",orderOpenTime:" + orderOpenTime +
                           ",orderCloseTime:" + orderCloseTime +
                           ",accountBalance:" + accountBalance +
                           ",orderValueProcent:" + orderValueProcent +
                           ",orderProfit:" + orderProfit +
                           ",orderProfitProcent:" + orderProfitProcent;
     }
    }
 }
      Print("requestRaw :" + requestHistoryRaw);
      char requestHistory[];
      ArrayResize(requestHistory, StringToCharArray(requestHistoryRaw, requestHistory,0,WHOLE_ARRAY,CP_UTF8)-1);
      //string requestRawToSend = CharArrayToString(request,0,WHOLE_ARRAY,CP_UTF8);
      //PrintFormat("requestRawToSend : %s", requestRawToSend);
      res = WebRequest("POST",url,cookie,NULL,timeout,requestHistory,ArraySize(requestHistory),result,headers);
//--- проверка ошибок
   if(res==-1)
     {
         Print("Ошибка в WebRequest. Код ошибки  =",GetLastError());
     }
   else
     {
         PrintFormat("HTTP status: %d", res);
         PrintFormat("Server Response: %s", CharArrayToString(result));
     }
     
     // Send opened orders
//     string url = "http://hackathon.ftf.fund/data.php";
//     int openedOrdersAmount = OrdersTotal();
//     int ordersHistoryAmountPrev = ordersHistoryAmount;
//     while (True) {
//     ordersHistoryAmount = OrdersHistoryTotal();
//     Print(ordersHistoryAmount);
//      if (ordersHistoryAmount != ordersHistoryAmountPrev) {
//      Print("Hui");
//         while (ordersHistoryAmountPrev < ordersHistoryAmount)
//         {
//            requestHistoryRaw = "";
//            if(OrderSelect(ordersHistoryAmountPrev,SELECT_BY_POS,MODE_HISTORY)==false)
//            {
//               Print("Ошибка при доступе к исторической базе (",GetLastError(),")");
//               break;
//            }
//           else {
//               OrderPrint();
//               orderTypeInt = OrderType();
//               if (orderTypeInt < 2){  
//               
//                  orderType = (orderTypeInt == 1) ? "short" : "long"; 
//                  orderId               = OrderTicket();
//                  orderValue         = OrderLots();
//                  orderOpenPrice     = OrderOpenPrice();
//                  orderClosePrice    = OrderClosePrice();
//                  orderSymbol        = OrderSymbol();
//                  orderOpenTime      = OrderOpenTime();
//                  orderCloseTime     = OrderCloseTime();
//                  accountBalance     = AccountBalance();
//                  orderValueProcent  = ((orderValue*orderOpenPrice)/accountBalance)*100;
//                  orderProfit        = (OrderProfit() + OrderCommission());
//                  orderProfitProcent = orderProfit/(orderValue * orderOpenPrice);
//                  
//                  requestHistoryRaw +=  "xxx" + orderId + "www" +
//                                 ",orderId:" + orderId +
//                                 ",orderType:" + orderType +
//                                 ",orderOpenPrice:" + orderOpenPrice +
//                                 ",orderClosePrice:" + orderClosePrice +
//                                 ",orderSymbol:" + orderSymbol +
//                                 ",orderOpenTime:" + orderOpenTime +
//                                 ",orderCloseTime:" + orderCloseTime +
//                                 ",accountBalance:" + accountBalance +
//                                 ",orderValueProcent:" + orderValueProcent +
//                                 ",orderProfit:" + orderProfit +
//                                 ",orderProfitProcent:" + orderProfitProcent;
//           }
//      }
//     }
//     Print(requestHistoryRaw);
//      ArrayResize(requestHistory, StringToCharArray(requestHistoryRaw, requestHistory,0,WHOLE_ARRAY,CP_UTF8)-1);
//      //string requestRawToSend = CharArrayToString(request,0,WHOLE_ARRAY,CP_UTF8);
//      //PrintFormat("requestRawToSend : %s", requestRawToSend);
//      res = WebRequest("POST",url,cookie,NULL,timeout,requestHistory,ArraySize(requestHistory),result,headers);
//     }
   url = "http://hackathon.ftf.fund/open.php";
     int ordersOpenAmount  = OrdersTotal();
   accountId = AccountNumber(); 
  Print("ordersOpenAmount: " + ordersOpenAmount);

   string requestOpenRaw = "history=";
  for (i=0; i < ordersOpenAmount; i++) {
     if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES)==false)
      {
         Print("Ошибка при доступе к исторической базе (",GetLastError(),")");
         break;
      }
     else {
         OrderPrint();
          orderTypeInt = OrderType();
         if (orderTypeInt < 2){  
         
             orderType = (orderTypeInt == 1) ? "short" : "long"; 
             orderId               = OrderTicket();
             orderValue         = OrderLots();
             orderOpenPrice     = OrderOpenPrice();
             orderSymbol        = OrderSymbol();
             orderOpenTime      = OrderOpenTime();
             accountBalance     = AccountBalance();
             orderValueProcent  = ((orderValue*orderOpenPrice)/accountBalance)*100;
            requestOpenRaw +=  "xxx" + orderId + "www" +
                           ",orderId:" + orderId +
                           ",orderType:" + orderType +
                           ",orderOpenPrice:" + orderOpenPrice +
                           ",orderSymbol:" + orderSymbol +
                           ",orderOpenTime:" + orderOpenTime +
                           ",orderValueProcent:" + orderValueProcent;
                          
     }
    }
 }
      Print("requestRaw :" + requestHistoryRaw);
      char requestOpen[];
      ArrayResize(requestOpen, StringToCharArray(requestOpenRaw, requestOpen,0,WHOLE_ARRAY,CP_UTF8)-1);
      //string requestRawToSend = CharArrayToString(request,0,WHOLE_ARRAY,CP_UTF8);
      //PrintFormat("requestRawToSend : %s", requestRawToSend);
      res = WebRequest("POST",url,cookie,NULL,timeout,requestOpen,ArraySize(requestOpen),result,headers);
//--- проверка ошибок
   if(res==-1)
     {
         Print("Ошибка в WebRequest. Код ошибки  =",GetLastError());
     }
   else
     {
         PrintFormat("HTTP status: %d", res);
         PrintFormat("Server Open Response: %s", CharArrayToString(result));
     }    
     
  }
 
//+------------------------------------------------------------------+
