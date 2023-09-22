trigger ContactTrigger on Contact (before insert, before update, after insert) {
    if(trigger.isBefore && (trigger.isInsert || trigger.isUpdate)){
        ContactTriggerHandler.checkDuplicate(trigger.new);
    }
    if(trigger.isAfter && trigger.isInsert){
        ContactTriggerHandler.accountRelatedToContact(trigger.new);
    }
}