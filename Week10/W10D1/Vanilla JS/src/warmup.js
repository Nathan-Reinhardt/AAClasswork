
const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
  let newP = document.createElement("p");
  newP.innerHTML = string;
  if (htmlElement.children.length === 0) {
    htmlElement.appendChild(newP);
  } else {
    htmlElement.removeChild(htmlElement.children[0]);
    htmlElement.appendChild(newP);
  }

};

htmlGenerator('Welcome To the Pocket Project Marathon!', partyHeader);