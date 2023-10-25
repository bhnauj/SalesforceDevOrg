public class locatitonCTRL{
    Locator__c lc = new Locator__c();
    public Double lat{get;set;}
    public Double lon{get;set;}
    public locatitonCTRL(){
        lc = new Locator__c();
    }
    
    public void loc(){
        System.debug('location----->'+lat);
       

        lc.Location__Latitude__s = lat;
        lc.Location__longitude__s = lon;
        Insert lc;
        
    }
    
    
    
}