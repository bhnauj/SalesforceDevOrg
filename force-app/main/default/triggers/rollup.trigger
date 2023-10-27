trigger rollup on Contact (after insert,after delete) {
    set<id> accid = new set<id>();
        if(trigger.isinsert){
        for(contact cc:trigger.new){
            if(cc.accountid!=null){
                accid.add(cc.accountid);
            
            }      
        }
     }   
        if(trigger.isdelete){
         for(contact cc:trigger.old){
            if(cc.accountid!=null){
                accid.add(cc.accountid);
            
            }      
        }
   }     
        
    list<account> acclist1= new list<account>();
    list<account> acclist=[select id,NumberofLocations__c,(select accountid from contacts) from account where id IN:accid];
        for(account acc:acclist){
            for(contact cc:acc.contacts){
                acc.NumberofLocations__c = acc.contacts.size();
                acclist1.add(acc);
            
            }
        }
        if(acclist1.size()>0 && acclist!= null){
            update acclist;
        
        }
   }