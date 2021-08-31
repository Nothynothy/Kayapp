const closeLegend = () => {
  const closeBtn = document.querySelector('.cross');
  const divLegend = document.querySelector('.search-legend');
  const legendStatus = localStorage.getItem('legendAlert');
  if (legendStatus == 'hide'){ divLegend.style.display = 'none' };
  if (closeBtn !== null){
    closeBtn.addEventListener('click', () => {
      divLegend.style.display = 'none';
      localStorage.setItem('legendAlert', 'hide');
    })
  }
}

export { closeLegend };
