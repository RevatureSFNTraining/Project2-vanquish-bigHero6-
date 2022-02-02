import { LightningElement, wire, api } from 'lwc';

export default class SearchAccounts extends LightningElement {
    @api key;
    // -- ONCHANGE INPUT HANDLER FUNCTION (gets data from html: clicked or not) ---
    updateKey(event){
        this.key = event.target.value;
    }

    // -- ONCLICK BUTTON HANDLER FUNCTION 
    // -- Search begins when button is clicked
    handleSearch(){
        this.key = event.target.value;
        
    }
}