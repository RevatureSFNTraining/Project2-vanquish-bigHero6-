import { LightningElement, wire, track, api } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import getBookById from '@salesforce/apex/Product2Controller.getBookById';
import getBookAuthor from '@salesforce/apex/Product2Controller.getBookAuthor';

export default class BookDetails extends LightningElement {

    cover = "https://images1.penguinrandomhouse.com/cover/9780143134206";
    @track genres = [];

    currentPageReference = null; 
    urlStateParameters = null;

    urlId = null;
    @track book = {};
    @track author = {};
    error = null;

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
       if (currentPageReference) {
          this.urlStateParameters = currentPageReference.state;
          this.urlId = this.urlStateParameters.id || null;

          console.log(this.urlId);

          getBookById({bookId : this.urlId})
            .then(result => {
                console.log(result);
                this.book = result;

                let genreString = this.book.Genre__c.toString();
                this.genres = genreString.split(';');

                console.log(this.book.Author__c);

                getBookAuthor({authorName : this.book.Author__c})
                    .then(data => {
                        console.log('entro');
                        console.log(data);
                        this.author = data;
                    })
                    .catch(error => {
                        this.error = error;
                    });

            })
            .catch(error => {
                this.error = error;
            });

            
       }
    }

    connectedCallback() {
       
   
    }

    get bookPrice() {
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