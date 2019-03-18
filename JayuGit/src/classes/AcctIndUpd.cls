global class AcctIndUpd implements Database.Batchable<sObject> {
	/* This is Guna */
	/* this is for Jayu Project */
    global static string query = 'select id, name from account where name=\'Acme1\'';
    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, list<Account> scope){
        emailTemplate et = [select id, name from emailTemplate where name='Survey Email EN'];
        for(Account a: scope){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {a.owner.email});
            mail.setSubject('this is Subject'+Date.today());
            mail.setPlainTextBody('this is to let you know that there is a survey');
            mail.setSaveAsActivity(false);
            mail.setTemplateId(et.Id);
            Messaging.SingleEmailMessage[] message = new Messaging.SingleEmailMessage[]{mail};
                Messaging.sendEmailResult[] result = Messaging.sendEmail(message);
            if(result[0].Success){
                system.debug('The email is sent successfully');
               }
            else {
                system.debug('there is an issue with email sending');
            }
        }
    }
    
    global void finish(Database.BatchableContext bc){
        String body = 'This is email from finish';
        String subject = 'this is subject';
        List<String> address = new List<String>();
            address.add('gunasekar.ps@gmail.com');
            address.add('subhapretty@gmail.com');
        	emailTemplate et = [select id, name from emailTemplate where id = '00X0o00000278vOEAQ'];
        
        	Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setToAddresses(address);
            //email.setSubject(subject);
            //email.setPlainTextBody(body);
            email.setTemplateId(et.id);
            Messaging.SingleEmailMessage[] message = new List<Messaging.singleEmailMessage>{email};
            
            Messaging.SendEmailResult[] result = Messaging.sendEmail(message);
    }

}