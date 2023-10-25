trigger cponopp on Opportunity (after insert) {

    set<id> accid = new set<id>();
    for(opportunity opp: trigger.new){
        
        if(opp.accountid!=null){
            accid.add(opp.accountid);
        }
    }
    list<account> acclist1 = new list<account>();
 list<account> acclist2 = [select id,Total_Value__c ,(select amount from opportunities) from account where id IN : accid];
    for(account acc:acclist2){
        acc.Total_Value__c=0;
        for(opportunity opp : acc.opportunities){
        acc.Total_Value__c += opp.Amount;
            
    }
        acclist1.add(acc);
    }
    update acclist1;
}