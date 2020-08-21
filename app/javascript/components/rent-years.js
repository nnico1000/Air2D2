const calculYear = () => {
  if (document.querySelector("#range_start")) {
    const startYear = document.getElementById("range_start");

    startYear.addEventListener("change", (event) => {
      const startYearValue = parseInt(startYear.value, 10);
      const years = document.getElementById('years');
      const yearsLength = parseInt(years.innerText, 10);
      const endYear = document.getElementById("range_end");
      const calcul = startYearValue + yearsLength;
      endYear.value = calcul;
    });
  }
}

export { calculYear };

