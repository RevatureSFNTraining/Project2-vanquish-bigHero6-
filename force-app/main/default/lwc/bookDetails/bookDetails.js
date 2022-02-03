import { LightningElement, wire, track, api } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import getBookById from '@salesforce/apex/Product2Controller.getBookById';
import getBookAuthor from '@salesforce/apex/Product2Controller.getBookAuthor';

export default class BookDetails extends LightningElement {

    @track genres = [];

    @api currentPageReference = null; 
    @api urlStateParameters = null;

    @api urlId = null;
    @track book = {};
    @track author = {};
    @track error = null;

    @api authorUrl = null;


    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
       if (currentPageReference) {
            
          this.urlStateParameters = currentPageReference.state;
          this.urlId = this.urlStateParameters.id || null;

          console.log(this.urlId);

          getBookById({bookId : this.urlId})
            .then(result => {
                this.book = result;

                let genreString = this.book.Genre__c.toString();
                this.genres = genreString.split(';');

                getBookAuthor({authorName : this.book.Author__c})
                    .then(data => {
                        
                        console.log(data);
                        this.author = data;

                        let urlString = window.location.href;
                        let baseURL = urlString.substring(0, urlString.indexOf("/s"));
                        this.authorUrl = baseURL + '/s/author-details?id=' + this.author.Id;
                        console.log(this.authorUrl);
                    })
                    .catch(error => {
                        this.error = error;
                    });

            })
            .catch(error => {
                this.error = error;
                console.log(error);
            });

            
       }
    }

    connectedCallback() {
       
   
    }

    
    @api get bookPrice() {
        if(this.book.PricebookEntries == null)
            return 0;
        else
            return this.book.PricebookEntries[0].UnitPrice;
    }
    

    accordionTitle(title) {
        return 'About ' + title;
    }

    accordianSection = '';

    handleToggleSection(event) {
          if(this.accordianSection.length === 0){
            this.accordianSection =''
        }
        else{
            this.accordianSection ='Account'
        }

    }

    get bookAccordionTitle() {
        return 'About ' + this.book.Name;
    }

    get authorAccordionTitle() {
        return 'About ' + this.book.Author__c;
    }


}