@istest
public class rolluptest {
    Static testmethod void testrollup() {
        
        Account acc = new Account();
        acc.Name='bhanuj';
        acc.Phone='9855550983';
        insert acc;
        Contact cc = new Contact();
        cc.LastName ='pandey';
        cc.AccountId=acc.Id;
        insert cc;
        delete cc;
        
    }
    
}