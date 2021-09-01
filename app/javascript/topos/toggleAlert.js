const toggleAlert = () => {
  const chevron = document.querySelector('.fa-chevron-down');
  const alertBanner = document.querySelector('.alert-banner');
  const graph = document.querySelector('#water-info')
  const topoCard = document.querySelector('.topo')

  console.log(topoCard);

  graph.style.display = "flex";
  if (chevron !== null){

    topoCard.style.margin = "130px 0px 0px 0px";

    chevron.addEventListener('click', () => {
      alertBanner.classList.toggle("alert-display");
      if (graph.style.display === "flex") {
        graph.style.display = "none";
      } else {
        graph.style.display = "flex";
      }
    })
  } else {
    topoCard.style.margin= "80px 0px 0px 0px";
  }
}

export { toggleAlert };
