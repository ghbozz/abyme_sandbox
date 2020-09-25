import { Controller } from 'stimulus';

export default class extends Controller {
	static targets = ['modal'];

	openModal(event) {
		this.modalTarget.classList.remove('opacity-0', 'pointer-events-none');
	}

	closeModal(event) {
		this.modalTarget.classList.add('opacity-0', 'pointer-events-none');
	}
}
