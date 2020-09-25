import { Controller } from 'stimulus';

export default class extends Controller {
	static targets = ['modal'];

	openModal(event) {
		console.log(this.modalTarget);
	}
}
