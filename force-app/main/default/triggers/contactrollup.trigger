trigger contactrollup on Contact (after insert , after delete) {
    
    set<id> accIdSet = new set<id>();
    if (trigger.isinsert){
        for(contact cc : trigger.new){
            
            if(cc.AccountId != null){
                accIdSet.add(cc.AccountId);
                
            }
        }
        
    
        for(AggregateResult ar : [SELECT count(id) Conts, accountId , Gender__c 
                                  FROM contact  
                                  WHERE accountId != Null 
                                  AND Gender__c != null
                                  AND AccountId IN :accIdSet
                                  group by accountId,Gender__c 
                                  order by accountId]){
            
            Account tempacc = new Account();
            tempacc.id = (string)ar.get('AccountId');                          
                                      
            
            
        }
     }
}