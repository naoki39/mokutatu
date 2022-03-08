function post (){
  const favorites = document.getElementsByClassName("favorite");
  favorites.addEventListener("click", () => {
    console.log("いいね");
  });
};

window.addEventListener('load', post );