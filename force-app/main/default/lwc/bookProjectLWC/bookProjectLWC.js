import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class BookProjectLWC extends LightningElement {
    @api objectApiName = 'Book_Project__c';

    _title = "Book Project Submitted";
    message = "Your Book Project has been submitted. Please wait 24 hours until you hear back from the Volcano Dragon team. Make sure to check your e-mail for updates!";
    variant = 'success';
    handleReset(event) {
        const inputFields = this.template.querySelectorAll(
            'lightning-input-field'
        );
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
     }
     handleSuccess(event) {
        const evt = new ShowToastEvent({
            title: this._title,
            message: this.message,
            variant: this.variant,
        });
        this.dispatchEvent(evt);
            
    }
}