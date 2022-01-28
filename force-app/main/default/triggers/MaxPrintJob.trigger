trigger MaxPrintJob on Print_Job__c (before insert, before update) {
    Switch on Trigger.OperationType{
        when BEFORE_INSERT {
            MaxPrintJobHelper.myMethod(Trigger.new);
        }
        when BEFORE_UPDATE {
            MaxPrintJobHelper.myMethod(Trigger.new);
        }
    }
}