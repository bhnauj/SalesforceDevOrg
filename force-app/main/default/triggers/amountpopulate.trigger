trigger amountpopulate on Account (after update) {
  set<id> accid  = new set<id>();
    for(account acc : trigger.new){
        if(acc.AnnualRevenue!=null)
            accid.add(acc.id);
    }
    list<contact> cclist1 = new list<contact>();
     list<account> acclist= [select AnnualRevenue,(select  amount__c from contacts)from account where id IN : accid];
    for(account acc : acclist){
        for(contact cc:acc.contacts){
            cc.amount__c=0;
            if(acc.AnnualRevenue!=null){
             cc.amount__c= acc.AnnualRevenue/2;
                cclist1.add(cc);
            }
   
            }
        update cclist1;
        }
}