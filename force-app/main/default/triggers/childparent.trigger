trigger childparent on Contact (after insert) {
   /* set<id> accid = new set<id>();
    for(contact cc :trigger.new){
        if(cc.accountid!=null && cc.lastname!=null){
            accid.add(cc.accountid);   
        }
    }
    list<string> ccname = new list<string>();
    list<account> acclist1 = new list<account>();

    list<account> acclist = [select site,(select accountid,lastname from contacts) from account where id IN : accid];
    for(account acc:acclist){
        acc.site='';
        for(contact cc:acc.contacts){
            if(cc.lastname!=null){
                ccname.add(cc.lastname);
                
            }
            acc.site=string.join(ccname,',');
            acclist1.add(acc);
            
            
        }
        
    }
    update acclist;
    */
    Set<Id> setId = new Set<Id>();
    
    for(Contact con : trigger.new) 
        setId.add(con.AccountId);
        
    Map<Id,Account> mapAcc = new Map<Id,Account>([SELECT Id,Site FROM Account WHERE Id IN : setId]);
    
   
    
    List<Contact> listCon = new List<Contact>([SELECT Id,Lastname,AccountId FROM Contact WHERE AccountId IN : setId]);
    
    if(listCon.size() > 0) {
        for(Contact con : listCon) {
            if(mapAcc.containsKey(con.AccountId)) {
               Account acc = mapAcc.get(con.AccountId);
                
               acc.Site = con.lastName+','+ acc.site ;
            }
                
        }
    }
    if(mapAcc.values().size()>0)
        update mapAcc.values();
    
}