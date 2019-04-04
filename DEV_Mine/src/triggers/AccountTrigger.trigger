trigger AccountTrigger on Account (after insert,after update) {

    if(trigger.isinsert)
    {
        AccountTriggerHelper.ContactOnAccount(trigger.new);
        AccountTriggerHelper.AccountCommunication(trigger.new);
        
    }
    
    if(trigger.isupdate)
    {
       AccountTriggerHelper.communicationCheck(trigger.new);  
    }
    
}