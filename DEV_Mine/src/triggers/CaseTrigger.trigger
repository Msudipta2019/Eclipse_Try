trigger CaseTrigger on Case (before insert,before update) {
    
    if(trigger.isinsert){
        
        CaseTriggerHelper.caseAssingedTo(trigger.new);
         CaseTriggerHelper.caseStatus(trigger.new);
        
    }
    if(trigger.isupdate){
               CaseTriggerHelper.caseAssingedTo(trigger.new);
         CaseTriggerHelper.caseStatus(trigger.new);
        
    }


}