public class wrappperExampleController {
    public List<wrapper> WrapList {get; set;}
   
    public wrappperExampleController(){
        WrapList = new List<wrapper>();
        List<Account> AccList = [Select Id,Name,Phone from Account LIMIT 10 ];
        for(Account ac : AccList){
            WrapList.add(new Wrapper(ac));
            system.debug('>>>>wraplist>>>>>'+WrapList);
        }
        
    }
    
    
    
    public class Wrapper{
        public boolean checkbox {get; set;}
        public Account acc		{get; set;}
        
        public wrapper(Account ac){
            acc=ac;
            checkbox = False;
            
        }
    }
    public Void RemoveAcc(){
        
    }
}