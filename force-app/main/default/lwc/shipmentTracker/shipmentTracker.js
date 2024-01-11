import { LightningElement, wire, track } from 'lwc';

import startRequest from '@salesforce/apexContinuation/ShippingTrackerController.startRequest';

export default class ShipmentTracker extends LightningElement {

    @track trackingSatus;
    @track error;

    connectedCallback() {
        startRequest()
            .then(result => {
                result = result.replace(/^"|"$/g, '');
                this.trackingSatus = result;
                console.log(result);
            })
            .catch(error => {
                this.error = error;
                console.log(error);
            });
    }
}