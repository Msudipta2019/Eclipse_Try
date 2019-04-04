trigger ContactTrigger on Contact (after insert,after update,before insert,after delete) {
 
    
    if(trigger.isinsert && trigger.isafter){
            
           // ContactHelper.CaseonContact(trigger.new) ;
         // ContactMerge.ContactMergeduplicate(trigger.new); 
         List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
        ContactHelper.CountContact(modContacts);
         
        system.debug('I AM HERE::::');
    }
    if(trigger.isinsert && trigger.isbefore){
            
           
           
    }
    
    if(trigger.isupdate && trigger.isafter)
    {
        
        ContactHelper.CaseClose(trigger.new);
         List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
        system.debug('Here:::'+modContacts );
        ContactHelper.CountContact(modContacts);
    }
    
    if(trigger.isdelete && trigger.isafter)
    {
        List<Contact> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
        ContactHelper.CountContact(modContacts);
    }
    

}