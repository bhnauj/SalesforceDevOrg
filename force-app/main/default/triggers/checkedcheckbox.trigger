trigger checkedcheckbox on Product_Per_Day_Price__c (before insert , after insert  ) {
List<Product__c> pList1=new List<Product__c>();
if(Trigger.isAfter){
  set<id> setIds = new set<id>();
  set<id> ppdId = new set<id>();
  for(Product_Per_Day_Price__c ppd:trigger.new){
   if(ppd.Product__c!=null){
    setIds.add(ppd.Product__c);
    ppdId.add(ppd.id);
   }
  }
 
      system.debug('---setIds--'+setIds);
  list<Product_Per_Day_Price__c> ppdList = [Select id,Active__c from Product_Per_Day_Price__c where Product__c =:setIds];
   system.debug('--ppdList--'+ppdList);
  for(Product_Per_Day_Price__c ppd:ppdList){
   ppd.Active__c = false;
  }
  update ppdList;
  list<Product_Per_Day_Price__c> ppdList1 = [Select id,Active__c from Product_Per_Day_Price__c where id =:ppdId];
    system.debug('--ppdList1--'+ppdList1);
  for(Product_Per_Day_Price__c ppd:ppdList1){
   ppd.Active__c = true;
  }
  update ppdList1;
  
  if(trigger.IsInsert){
  
   List<Product__c> pList = [select Price__c from Product__c where id IN : setIds];
        system.debug(pList);
    for(Product_Per_Day_Price__c ppd1:trigger.new){
      for(Product__c p:pList){
      if(ppd1.Active__c) 
          system.debug(p);          
              p.price__c=ppd1.Price__c;
              pList1.add(p);
          }
          
       }
      system.debug(pList1);
      update pList1;
  }
 }
 
}