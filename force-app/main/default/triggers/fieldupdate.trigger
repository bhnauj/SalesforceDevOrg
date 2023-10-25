trigger fieldupdate on Account (before update , before insert) {
    
    for(Account acc : trigger.new){
        
        if (acc.Type=='Prospect')
            acc.valid__c='Diamond';
    }
   
}