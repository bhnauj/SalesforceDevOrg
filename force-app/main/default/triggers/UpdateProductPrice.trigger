trigger UpdateProductPrice on Product_Per_Day_Price__c (after insert) {
    set<id> ppdId= new set<id>();
    for(Product_Per_Day_Price__c ppd: trigger.new){
        ppdId.add(ppd.Id);
    }
    

}