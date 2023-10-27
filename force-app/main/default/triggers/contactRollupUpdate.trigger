/***
 * Trigger on Contact
 * Bulk trigger
 * Insert, Delete
 * Field to be updated on Account No. of contacts
 * after insert, aftet delete
 */

trigger contactRollupUpdate on Contact (after insert,after delete) {
    
    Set<Id> accountIdSet = new set<id>();
    if (trigger.isInsert) {
        for (contact cc : trigger.new) {
            if(cc.AccountId != null){
                accountIdSet.add(cc.AccountId);
            }
        }
    }

    if (trigger.isDelete) {
        for (contact cc : trigger.old) {
            if(cc.AccountId != null){
                accountIdSet.add(cc.AccountId);
            }
        }
    }


    List<Account> updatedAccountList = new List<Account>();
    system.debug('sql limit before-->'+ Limits.getQueries());
    List<Account> accList = [ SELECT Id, No_of_Contact_Count__c FROM Account WHERE Id IN :accountIdSet];
    List<Contact> ccList = [SELECT AccountId FROM Contact WHERE AccountId IN :accountIdSet];
    system.debug('sql limit after-->'+ Limits.getQueries());
    system.debug(accList);
    
    for(Account acc: accList){
        for(Contact cc: ccList){
            acc.No_of_Contact_Count__c = ccList.size();
            if(! updatedAccountList.contains(acc)){
                updatedAccountList.add(acc);
            }
        }
    }

    if(updatedAccountList.size() > 0){
        update updatedAccountList;
    }
    

}
