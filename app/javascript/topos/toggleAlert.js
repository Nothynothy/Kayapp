const toggleAlert = () => {
  const chevron = document.querySelector('.fa-chevron-down');
  const alertBanner = document.querySelector('.alert-banner');
  const graph = document.querySelector('#water-info')
  graph.style.display = "flex";
  if (chevron !== null){
    chevron.addEventListener('click', () => {
      alertBanner.classList.toggle("alert-display");
      if (graph.style.display === "flex") {
        graph.style.display = "none";
      } else {
        graph.style.display = "flex";
      }
    })
  }
}

export { toggleAlert };
