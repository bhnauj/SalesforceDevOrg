// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

List<Contact> contactList = new List<Contact>();
for(Account acc : [SELECT Id FROM Account LIMIT 5]){
    for(Integer i=0;i<1;i++){
        contactList.add(new Contact(FirstName='FirstName_'+i, LastName='LastName_'+i, AccountId = acc.Id));
    }
}

Insert contactList;