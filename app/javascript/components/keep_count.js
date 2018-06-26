function keepCount() {

  const allCheckboxes = document.querySelectorAll('input[type=checkbox]')
  const submitButton = document.querySelector('#update-user')
  let yesChecked = document.querySelectorAll('input[type=checkbox]:checked')
  let notChecked = document.querySelectorAll('input[type=checkbox]:not(:checked)')


  if (yesChecked.length === 3) {
    notChecked.forEach(function(checkbox) {
      checkbox.disabled = true
    });
    submitButton.disabled = false
  }

  allCheckboxes.forEach(function(checkbox) {
    checkbox.addEventListener('click', function(e) {
      let yesChecked = document.querySelectorAll('input[type=checkbox]:checked')
      let notChecked = document.querySelectorAll('input[type=checkbox]:not(:checked)')

      if (yesChecked.length < 3) {
        notChecked.forEach(function(checkbox) {
          checkbox.disabled = false
        });
        submitButton.disabled = true
      }

      if (yesChecked.length === 3) {
        notChecked.forEach(function(checkbox) {
          checkbox.disabled = true
        });
        submitButton.disabled = false
      }
    })
  })
}

export {keepCount};
