public class OppertunityHelper {

    
    public static void CountOpportunity(list<opportunity> con ){
   //List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
    Set<Id> accIds  = new Set<Id>();
    for (opportunity c: con)  {
        accIds.add(c.AccountId);
    }
       // List<Account> lstAccount = [select id,  (select id from opportunities) from Account where id in: accIds];
   List<Account> modAccounts = [Select Name, (Select Id from opportunities)  from Account WHERE Id in: accIds ];
    List<Account> updAccount= new List<Account>();
    for (Account a: modAccounts) {
        if(a.opportunities.size()>0){
           //System.debug('Account:' + a.Name + ' No. of Contacts: '+ s.size()); 
       //a.CheckRelated__c = s.size();
       a.CheckRelated__c=true;
        
        updAccount.add(a);
        }
    }
       update updAccount;
}
}