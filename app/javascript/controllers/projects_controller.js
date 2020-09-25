import { Controller } from 'stimulus';

export default class extends Controller {
	static targets = ['modal'];

	openModal() {
		this.modalTarget.classList.remove('opacity-0', 'pointer-events-none');
	}

	closeModal() {
		this.modalTarget.classList.add('opacity-0', 'pointer-events-none');
		this.cleanErrors(this.modalTarget);
	}

	cleanErrors(modal) {
		modal.querySelectorAll('.error').forEach(item => {
			item.classList.remove('error');
		});

		modal.querySelectorAll('.error-feedback').forEach(item => {
			item.innerText = '';
		});
	}
}
