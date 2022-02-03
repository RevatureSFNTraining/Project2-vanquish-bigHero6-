import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';

export default class SearchContacts extends LightningElement {
    key;
    @track contacts;
    // -- ONCHANGE INPUT HANDLER FUNCTION (gets data from html) ---
    updateKey(event){
        this.key = event.target.value;
    }
    @wire(getContacts,{searchKey:'$key'}) contacts;

    // -- ONCLICK BUTTON HANDLER FUNCTION (calls Apex function) ---
    handleSearch(){
        getContacts({searchKey: this.key})     
        .then(result=> {
            this.contacts = result;
        })
        .catch(error=>{
            this.contacts = null;
        })
    }
    cols = [
        { label:'Contact Name', fieldName:'LastName', type:'text' },
        { label:'Phone', fieldName:'Phone', type:'phone' },
        { label:'Email', fieldName:'Email', type:'email' }
    ]
}