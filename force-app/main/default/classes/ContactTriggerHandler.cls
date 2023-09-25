public with sharing class ContactTriggerHandler {
    public static void checkDuplicate(List<Contact> conList){
        set<String> newConPhone = new Set<String>();
        set<String> newConEmail = new Set<String>();
        
        for(Contact con1 : conList){
            if(con1.Phone != null && con1.Email != null){
                newConPhone.add(con1.Phone);
                newConEmail.add(con1.Email);
            }
        }
        
        set<String> existingConPhone = new Set<String>();
        set<String> existingConEmail = new Set<String>();
        List<Contact> existingConList = [SELECT Phone, Email FROM Contact WHERE Phone IN :newConPhone AND Email IN :newConEmail];
        
        for(Contact con2 : existingConList){
            if(con2.Phone !=null && con2.Email !=null){
                existingConPhone.add(con2.Phone);
                existingConEmail.add(con2.Email);
            }
        }
        
        for(Contact con3 : conList){
            if(existingConPhone.contains(con3.Phone) || existingConEmail.contains(con3.Email)){
                con3.addError('Contact already present with same Email or Phone. Please check');
            }
        }
    }
    
    public static void accountRelatedToContact(List<Contact> conList){
        List<Account> acc = new List<Account>();
        for(Contact con : conList){
            if(con.AccountId != null){
                Account newAcc = new Account();
                newAcc.Id = con.AccountId;
                newAcc.Name = con.LastName;
                acc.add(newAcc);
            }
        }
        if(!acc.isEmpty()){
            insert acc;
        }
    }
}
