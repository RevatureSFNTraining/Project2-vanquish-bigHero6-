import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class BookProjectLWC extends LightningElement {
    @api objectApiName = 'Book_Project__c';

    _title_success = "Book Project Submitted";
    _title_error = "Book Project Failed to Submit";
    message_success = "Your Book Project has been submitted. Please wait 24 hours until you hear back from the Volcano Dragon team. Make sure to check your e-mail for updates!";
    message_error = "Please fix the problems that appear on the screen. Most likely you have not uploaded a file or pasted your text."
    variant_success = 'success';
    variant_error = 'error';
    
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
            title: this._title_success,
            message: this.message_success,
            variant: this.variant_success,
        });
        this.dispatchEvent(evt);
            
    }
    handleError(event) {
        const evt = new ShowToastEvent({
            title: this._title_error,
            message: this.message_error,
            variant: this.variant_error,
        });
        this.dispatchEvent(evt);
            
    }
}