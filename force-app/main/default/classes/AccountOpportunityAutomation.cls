public with sharing class AccountOpportunityAutomation {


    public void createRecords(Map<Account,List<Opportunity>> recordMap){

        if(recordMap.isEmpty()){
            throw new NullPointerException();
        }

        List<SObject> sObjectList = new List<SObject>();
        List<Opportunity> allOppList = new List<Opportunity>();
        for(Account acc : recordMap.keySet()){
            sObjectList.add(acc);
            List<Opportunity> oppList = mapOpportunities(recordMap.get(acc), acc.External_Id__c);
            if(oppList.isEmpty()){
                continue;
            }
            allOppList.addAll(oppList);
        }
        sObjectList.addAll(allOppList);
        INSERT sObjectList;
    }
    
    
    private List<Opportunity> mapOpportunities(List<Opportunity> opportunityList, String accExternalId){

        for(Opportunity opp : opportunityList){
            opp.Account = new Account(External_Id__c = accExternalId);
        }
    
        return opportunityList;
    }
}