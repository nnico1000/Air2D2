import Slider from 'bootstrap-slider';

const jauge = () => {
  var slider = new Slider('#ex1', {
    formatter: function(value) {
      return 'Current value: ' + value;
    }
  });

  let target = document.getElementById('ex1Slider');
  console.log(target);

  if (target) {
    const calcul = () => {
      let sliderValue = target.querySelector('.slider-handle').getAttribute('aria-valuenow')
      let price = document.getElementById('ex1').dataset.price

      let totalPrice = sliderValue * price
      console.log('slideer value');
      console.log(sliderValue);
      console.log('price_per_year value');

      console.log(totalPrice);
      document.getElementById("calculprice").textContent = totalPrice;
      document.getElementById("years").textContent = sliderValue;
    };

  // if (document.getElementById('ex1')) {
  //   var slider = new Slider('#ex1', {
  //   formatter: function(value) {
  //   return 'Current value: ' + value;
  //     }
  //   });

  //   let target = document.getElementById('ex1Slider');

  //   if (target) {
  //   const calcul = () => {
  //     let sliderValue = target.querySelector('.slider-handle').getAttribute('aria-valuenow')
  //     let price = document.getElementById('ex1').dataset.price

  //     let totalPrice = sliderValue * price
  //     console.log('slideer value');
  //     console.log(sliderValue);
  //     console.log('price_per_year value');

  //     console.log(totalPrice);
  //     document.getElementById("calculprice").textContent = totalPrice;
  //     document.getElementById("years").textContent = sliderValue;

  //   }
  //     slider.on('slide',function(sliderValue) {

  //   let totalPrice = sliderValue * price
  //   // console.log('slideer value');
  //   // console.log(sliderValue);
  //   // console.log('price_per_year value');

  //   // console.log(totalPrice);
  //   document.getElementById("calculprice").textContent = totalPrice;
  //   document.getElementById("years").textContent = sliderValue;
  //       calcul();
  //       // document.getElementById("ex6SliderVal").textContent = sliderValue;
  //       });
  //   }


    slider.on('slide',function(sliderValue) {
        calcul();

      // document.getElementById("ex6SliderVal").textContent = sliderValue;
      });

  }

}

export { jauge };


