
const dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator() {
  const keys = Object.keys(dogs);
  const dogs_arr = [];

  for (let i = 0; i < keys.length; i++) {
    let currentLi = document.createElement("li");
    currentLi.classList.add("dog-link");
    let currentA = document.createElement("a");
    currentA.innerHTML = `${keys[i]}`;
    currentA.href = `${dogs[keys[i]]}`;
    currentLi.appendChild(currentA);
    dogs_arr.push(currentLi);
  }
  return dogs_arr;
}

export default function attachDogLinks() {
  const dogLinks = dogLinkCreator();
  const ul = document.getElementsByClassName("drop-down-dog-list")[0];
  for (let i = 0; i < dogLinks.length; i++) {
    ul.appendChild(dogLinks[i]);
  }
}
attachDogLinks();

function handleEnter() {
  document.getElementById("drop-id")
  .addEventListener("mouseenter", function() {
    Array.from(document.getElementsByClassName("dog-link")).forEach(el => {
      el.style.visibility = "visible";
    });
  });
}

handleEnter();

function handleLeave() {
  document.getElementsByClassName("drop-down-dog-nav")[0]
  .addEventListener("mouseleave", function () {
    Array.from(document.getElementsByClassName("dog-link")).forEach(el => {
      el.style.visibility = "hidden";
    });
  });
}
handleLeave();