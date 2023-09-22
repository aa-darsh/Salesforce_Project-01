public with sharing class FetchCaseRecords {
    @AuraEnabled(cacheable=true)
    public static List<Case> fetchCaseRecords() {
        return([SELECT Id, CaseNumber, Status, Priority FROM Case]);
    }
}