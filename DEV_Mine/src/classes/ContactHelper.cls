public class ContactHelper {

    public static void CaseonContact(list<contact> con ){
        
       list<case> ct= new list<case>();
       
       for( Contact cont : con)
       {
           case cs= new case( subject='Update Contact',contactid=cont.id);
           ct.add(cs);
           
       }
       
       if (ct.size()>0)
       {
           insert ct;
           
       }
        
    }
    
        
     public static void CaseClose(list<contact> con )
    
     {
         list<case> listtoupdate=new list<case>();
         list<id> conid= new list<id>();
         
         for (Contact c: con)
         {
            conid.add(c.id);
                        
         }
         
         list<case> casecc= new list<case>([select id,status,subject from case where contactid IN: conid]);
          system.debug('O my God'+ casecc);  
         list<case> amg= new list<case>();
         for(contact contactcase : con ){
         for(case cc: casecc){
      
             if(contactcase.phone!=null && cc.Status!='Closed' && cc.Subject=='Update Contact')
       {
          cc.status='closed';
           listtoupdate.add(cc);
          
       }
    
      update listtoupdate;
             }
         }
         system.debug('Stat:' +[select status from case where contactid IN: con]);  
     }
    
   public static void CountContact(list<contact> con ){
   //List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
    Set<Id> accIds  = new Set<Id>();
    for (Contact c: con)  {
        accIds.add(c.AccountId);
    }
   List<Account> modAccounts = [Select Name, (Select Id from Contacts)  from Account WHERE Id in: accIds ];
    List<Account> updAccount= new List<Account>();
    for (Account a: modAccounts) {
       List<Contact> s = a.Contacts;
       System.debug('Account:' + a.Name + ' No. of Contacts: '+ s.size()); 
       //a.CheckRelated__c = s.size();
       a.CheckRelated__c=true;
        updAccount.add(a);
    }
       update updAccount;
}
    
  
}