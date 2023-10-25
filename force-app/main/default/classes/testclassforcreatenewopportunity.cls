@istest
public class testclassforcreatenewopportunity {
 
    static testmethod void testtestclassforopportunity(){

        account acct = new account(Name = 'sha',industry ='Electronics');
    //    Opportunity opp = new Opportunity(Name = 'sha',StageName = 'Prospecting',closedate = System.today() + 30);

      //  acct.name = 'sha';
        insert acct;
       // insert opp;
    }
}