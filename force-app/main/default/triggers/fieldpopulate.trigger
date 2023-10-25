trigger fieldpopulate on Account (before insert) {

    for(account acc : trigger.new){
        if(acc.phone!=null){
            acc.name='Bhanuj';
        }
        }
}