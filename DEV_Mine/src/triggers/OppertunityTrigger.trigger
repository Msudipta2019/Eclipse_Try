trigger OppertunityTrigger on Opportunity(after insert,after update,before insert,after delete) {
 
    
    if(trigger.isinsert && trigger.isafter){
         
         List<Opportunity> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
        OppertunityHelper.CountOpportunity(modContacts);
       
    }
    if(trigger.isinsert && trigger.isbefore){
            
           
           
    }
    
    if(trigger.isupdate && trigger.isafter)
    {
        
       
         List<Opportunity> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
        system.debug('Here:::'+modContacts );
        OppertunityHelper.CountOpportunity(modContacts);
    }
    
    if(trigger.isdelete && trigger.isafter)
    {
        List<Opportunity> modContacts = Trigger.isDelete ? Trigger.old:Trigger.new;
        OppertunityHelper.CountOpportunity(modContacts);
    }
    

}