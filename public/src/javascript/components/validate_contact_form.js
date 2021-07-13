const allInputs = document.querySelectorAll(".form-control");
const submitButton = document.querySelector('.btn');

const validateContactForm = () => {
  const contactForm = document.getElementById('contact-form');
  if (contactForm) {
    submitButton.disabled = true;
    submitButton.style.opacity = 0.5;
    const buttonWrapper = document.querySelector('#button-wrapper');
    buttonWrapper.addEventListener('mouseover', enableButton);
    allInputs.forEach((input) => {
      input.addEventListener('blur', enableButton);
    });
  }
}

const enableButton = () => {
  const emailInput = document.querySelector('#contact_email');
  const arrayOfAllInputs = Array.from(allInputs);
  const allInputsAreFilled = allFilled(arrayOfAllInputs);
  const emailIsValid = validEmail(emailInput);

  if (allInputsAreFilled && emailIsValid) {
    submitButton.disabled = false;
    submitButton.style.opacity = 1;
  } else {
    submitButton.disabled = true;
    submitButton.style.opacity = 0.5;
  }
};

const allFilled = (inputs) => {
  // Check that the value of every input is not an empty string
  return inputs.every((input) => {
    return input.value !== "";
  });
};

const validEmail = (input) => {
  const isValid = /^\w+@\w+(\.\w{2,6})+$/.test(input.value);
  addValidationClasses(input, isValid);
  return isValid;
};

const addValidationClasses = (input, isValid) => {
  if (input.value === "") {
    // No need to add classes if the input is not filled yet
    return;
  }
  if (isValid) {
    input.classList.remove('is-invalid');
    input.classList.add('is-valid');
  } else {
    input.classList.remove('is-valid');
    input.classList.add('is-invalid');
  }
};

export {validateContactForm};
