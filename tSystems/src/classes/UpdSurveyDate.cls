global class UpdSurveyDate implements Database.Batchable<sObject> {
	//global final List<String> query = [select id from contact where survey_Date__c != null];
	global final string field = 'survey_Date__c';
    global final Date value = Date.today();

    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select id, survey_Date__c from contact where lastname in ('Guna','Yashwanth')]);
    }
    
    global void execute(Database.BatchableContext bc, List<Contact> scope){

        for(Contact cont: scope){
            cont.put(field, value);
            
        }
        update scope;
        
    }
    
    global void finish(Database.BatchableContext bc){
        //sending email code
        /*Id templateId = [select id from emailTemplate where name = 'Survey Email DE'];
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.setToAddresses('gunasekar.ps@gmail.com');
        message.getTemplateId(templateId);
        
        Messaging.SingleEmailMessage[] messages = new List<Messaging.SingleEmailMessage> {message};
            Messaging.SendEmailResult[] result = Messaging.sendEmail(messages); */
    }
    
}