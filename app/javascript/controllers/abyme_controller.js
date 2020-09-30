import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['template', 'associations'];
  
  connect() {
    console.log('Abyme Connect')
  }

  add_association(event) {
    event.preventDefault();

    const content = this.templateTarget.innerHTML.replace(/NEW_RECORD/g, new Date().getTime())
    this.associationsTarget.insertAdjacentHTML('beforebegin', content)
  }

  remove_association(event) {
    event.preventDefault()
    console.log(event)


    let wrapper = event.target.closest('.abyme--fields')

    wrapper.querySelector("input[name*='_destroy']").value = 1
    wrapper.style.display = 'none'
  }
}
