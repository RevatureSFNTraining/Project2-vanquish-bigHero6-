trigger PrintJobTrigger on Print_Job__c (before insert) {
	 Switch on Trigger.OperationType{
        when BEFORE_INSERT {
            PrintJobHelper.myMethod(Trigger.new);
        }
     }
}