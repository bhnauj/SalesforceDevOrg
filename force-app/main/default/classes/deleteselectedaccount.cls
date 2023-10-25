public class deleteselectedaccount{
public List<wrapper> wrapList {get; set;}
public List<wrapper> wrap {get;set;}

    public deleteselectedaccount(){
        wrap = new List<wrapper>();
        for(Account ac : [Select id,name from Account]){
            wrap.add(new wrapper(ac));
        }
    }
    
    public pageReference deleteList(){
        List<Account> delacc = new List<Account>();
        for(wrapper dellist : wrap ){
            if(dellist.isselected==True){
                delacc.add(dellist.acc);
            }
        }
    
        delete delacc;
        return null;
    }

    public class wrapper{
        public Account acc {get; set;}
        public boolean isselected {get; set;}
        
        
        public wrapper(Account a){
            acc = a;
            isselected = False;
        }
        
    }
}