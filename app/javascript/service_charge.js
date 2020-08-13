window.addEventListener('load', function(){

  const taxRate = 0.1;
  const price = document.getElementById("item_price");
  const taxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  price.addEventListener('change', function() {
    taxPrice.value = price.value * taxRate;
    console.log(price.value)
    taxPrice.innerHTML = price.value * taxRate;
    profit.innerHTML = price.value - taxPrice.value;
  })

})
