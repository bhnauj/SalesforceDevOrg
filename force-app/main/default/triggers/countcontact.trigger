trigger countcontact on Account (after insert , after update) {
   
        list<contact> ct = new list<contact>();
        for(Account acc : trigger.new){
            if(acc.number_of_contacts__c!=null){
                for(integer i=0;i<acc.number_of_contacts__c;i++){ 
                    contact cc = new contact(lastname ='contact '+i,accountid=acc.id);
                    ct.add(cc);
 
                }
            }
        }   
                if(ct!=NULL){
                    insert  ct;
                    
                    
                }
}