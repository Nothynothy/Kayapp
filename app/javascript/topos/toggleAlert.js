const toggleAlert = () => {
  const chevron = document.querySelector('.fa-chevron-down');
  const alertBanner = document.querySelector('.alert-banner');
  if (chevron !== null){
    chevron.addEventListener('click', () => {
      alertBanner.classList.toggle("alert-display");
    })
  }
}

export { toggleAlert };
