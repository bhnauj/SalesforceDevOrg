trigger cponcontact on Contact(after insert) {
    set < id > accid = new set < id > ();
    for (contact cc: trigger.new) {
        if (cc.Gender__c != null) {
            accid.add(cc.accountid);
        }
    }

    list < account > acclist1 = new list < account > ();

    list < account > acclist = [select Number_of_Male__c, (select accountid, Gender__c from contacts) from account where id IN: accid];
    for (account acc: acclist) {
        acc.Number_of_Male__c = 0;
        acc.Number_of_Female__c = 0;
        for (contact cc: acc.contacts) {
            if (cc.Gender__c == 'Male') {
                acc.Number_of_Male__c += 1;


            }

            if (cc.Gender__c == 'female') {
                acc.Number_of_Female__c += 1;


            }



        }
        acclist1.add(acc);
    }
    update acclist1;
}