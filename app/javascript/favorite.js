function post (){
  const votes = document.getElementsByClassName("");
  votes.addEventListener("click", () => {
    console.log("いいね");
  });
};

window.addEventListener('load', post );