const toggleFav = () => {
  const favorite = document.getElementById("favorite-icon");
  if (favorite !== null){
    favorite.addEventListener("click", () => {
      favorite.classList.toggle("fav-active");
    });
  }
}
export { toggleFav }
