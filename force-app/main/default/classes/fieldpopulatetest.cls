@istest
public class fieldpopulatetest {

    static testmethod void testfieldpopulate(){
        
        account acc = new account();
        acc.Phone = '9996102340';
        insert acc;
    }
}