import { LightningElement,api } from 'lwc';

export default class LwcHelloWorldTest extends LightningElement {
    @api url;
    @api clickAboutUs;
    @api clickCareers;
    @api clickContactUs;
    @api clickPrivacyPolicy;
    @api clickTerms;
    @api clickFaq;
    @api clickOrderBook;
    @api clickPublishBook;
}