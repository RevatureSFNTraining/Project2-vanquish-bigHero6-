import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

export default class BookDetails extends LightningElement {

    @api recordId;

    @wire(getRecord, { recordId: '$recordId', 
        fields: ['Product2.Name', 'Product2.Author__c', 'Product2.Genre__c', 'Product2.ISBN__c']
    }) record;

    get title() {
        return this.record.data.fields.Name.value;
    }

    get author() {
        return this.record.data.fields.Author__c;
    }

    get genre() {
        return this.record.data.fields.Genre__c;
    }

    get isbn() {
        return this.record.data.fields.ISBN__c;
    }

}
