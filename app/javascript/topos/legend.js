const closeBtn = document.querySelector('.cross');
const divLegend = document.querySelector('.search-legend');
const closeLegend = () => {
  closeBtn.addEventListener('click', () => {
    divLegend.style.display = 'none';
  })
}

export { closeLegend };
