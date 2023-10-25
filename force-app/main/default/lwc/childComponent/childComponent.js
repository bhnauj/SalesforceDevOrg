import { LightningElement,api } from 'lwc';
export default class ChildComponent extends LightningElement {
    count = 0;
    @api getValueFromParent;


    increaseCount() {
        this.dispatchEvent(new CustomEvent('increasecount', {
            detail: {
                message: 'Increased count to ' + (++this.count)
            }
        }));
    }
}