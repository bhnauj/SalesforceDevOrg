trigger changeOpportunityStage on Opportunity (after insert,before update) {
    for( opportunity opp: trigger.new){
        if(opp.StageName == 'Closed Won')
            opp.Account_type__c = 'Customer';
    }
    
}