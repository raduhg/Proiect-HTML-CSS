const firstName = document.getElementById('first-name');
const lastName = document.getElementById('last-name');
const email = document.getElementById('email');
const message = document.getElementById('message');
const form = document.getElementById('form');
const errorFirstName = document.getElementById('error-first-name');
const errorLastName = document.getElementById('error-last-name');
const errorEmail = document.getElementById('error-email');
const errorMessage = document.getElementById('error-message');

form.addEventListener('submit', (e) => {
    let sem = 0;
    if (firstName.value === '' || firstName.value === null) {
        errorFirstName.innerText = 'First name is required';
        sem = 1;
    }

    if (lastName.value === '' || lastName.value === null) {
        errorLastName.innerText = 'Last name is required';
        sem = 1;
    }

    var validRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
    if (!(email.value.match(validRegex))) {
        errorEmail.innerText = 'Enter a valid email adress';
        sem = 1;
    }

    if (message.value.length < 15) {
        errorMessage.innerText = 'Message too short';
        sem = 1;
    }

    if (sem === 1) {
        e.preventDefault();
    }

})