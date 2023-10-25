trigger updateaccountfield on Account ( before insert , after update) {
    for(Account acc: Trigger.new){
        
        if(Acc.Name !=null){
            
            Acc.Website='xyz.com';
            Acc.Phone='123456789';
            Acc.ShippingPostalCode='124001';
        }
    }
    
    
}