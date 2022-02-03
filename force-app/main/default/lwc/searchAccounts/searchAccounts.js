import { LightningElement, track, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountController.getAccounts';

export default class SearchAccounts extends LightningElement {
    key;
    @track accounts;
    // -- ONCHANGE INPUT HANDLER FUNCTION (gets data from html) ---
    updateKey(event){
        this.key = event.target.value;
    }
    @wire(getAccounts,{searchKey:'$key'}) accounts;

    // -- ONCLICK BUTTON HANDLER FUNCTION (calls Apex function) ---
    handleSearch(){
        getAccounts({searchKey: this.key})     
        .then(result=> {
            this.accounts = result;
        })
        .catch(error=>{
            this.accounts = null;
        })
    }
    cols = [
        { label:'Account Name', fieldName:'Name', type:'text' },
        { label:'Phone', fieldName:'Phone', type:'phone' },
        { label:'Industry', fieldName:'Industry', type:'text' },
        { label:'Website', fieldName:'Name', type:'url' }
        
    ]
}