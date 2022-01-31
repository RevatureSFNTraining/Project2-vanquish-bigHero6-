import { LightningElement, api } from 'lwc';

// import SHIPMENT_OBJECT from '@salesforce/schema/Shipment__c';
import SHIPMENT_ACCOUNT_FIELD from '@salesforce/schema/Shipment__c.Account__c';
import SHIPMENT_ARRIVAL_DATE_FIELD from '@salesforce/schema/Shipment__c.Arrival_Date__c';
import SHIPMENT_BOOK_PROJECT_FIELD from '@salesforce/schema/Shipment__c.Book_Project__c';
import SHIPMENT_PRINTING_PRESS_FIELD from '@salesforce/schema/Shipment__c.Printing_Press__c';
import SHIPMENT_QUANTITY_FIELD from '@salesforce/schema/Shipment__c.Quantity__c';
import SHIPMENT_SHIPPING_COST_FIELD from '@salesforce/schema/Shipment__c.Shipping_Cost__c';
import SHIPMENT_STATUS_FIELD from '@salesforce/schema/Shipment__c.Status__c';
import SHIPMENT_STORE_FIELD from '@salesforce/schema/Shipment__c.Store__c';
import SHIPMENT_NAME_FIELD from '@salesforce/schema/Shipment__c.Name';

export default class Orderformlwc extends LightningElement {
    @api objectApiName = 'Shipment__c';

    fields = [SHIPMENT_NAME_FIELD, 
        SHIPMENT_STORE_FIELD, 
        SHIPMENT_STATUS_FIELD,
        SHIPMENT_SHIPPING_COST_FIELD,
        SHIPMENT_QUANTITY_FIELD,
        SHIPMENT_PRINTING_PRESS_FIELD,
        SHIPMENT_ACCOUNT_FIELD,
        SHIPMENT_ARRIVAL_DATE_FIELD,
        SHIPMENT_BOOK_PROJECT_FIELD
    ];

}