public class DemoClass {
    
    @AuraEnabled
    public static List<Account> getAccount(){
        List<Account> accList = new List<Account>();
        accList = [SELECT id,Name from Account limit 10];
        if(accList.size()>0)
            return accList;
        else
            return null;
        
    }
    
}