global class sessionBatchClass implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Account__r.Phone,Id,Logged_In__c,Session_Time__c,Token__c FROM Login_Session__c where Logged_In__c=True';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Login_Session__c> scope)
    {   
        system.debug('>>>>>>>>>>>>Scope>>>>>>>>>>' +scope);
        for(Login_Session__c a : scope){
            if(a.Session_Time__c == system.now()){
                String salt = String.valueOf(Crypto.getRandomInteger());
                String key = string.valueOf(a.Account__r.Phone)+string.valueOf(system.now());
                Blob data = crypto.generateMac('HmacSHA256',Blob.valueOf(salt), Blob.valueOf(key));
                string token= EncodingUtil.convertToHex(data).toUpperCase();                
                a.Logged_In__c=False;
                a.Token__c = token;  
            }
        }
        update scope;
        system.debug('>>>>>>>>>>>>>scope1>>>>>>' +scope);
    }  
    global void finish(Database.BatchableContext BC)
    {
    }
}