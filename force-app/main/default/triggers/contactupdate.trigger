trigger contactupdate on Account (after update) {
    set<id> accid = new set<id>();   
    for ( account acc: trigger.new){
        if(acc.phone != null){
            accid.add(acc.id);
        }
    }
     list<contact> conlist1 = new list<contact>();
    list<contact> conlist = [ select accountid , phone from contact where accountid =: accid];
        for(account acc:trigger.new){
            for(contact con:conlist){
                if(con.phone!=null){
                    con.phone=acc.phone;
                    conlist1 .add(con);
                
                }
            
            }
            update conlist1;
        }
    
}