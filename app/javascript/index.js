window.addEventListener('load', () => {

  const priceInput = document.getElementById("item-price");

  priceInput.addEventListener('input', function(){
    const Rate = 0.1;
    const price = priceInput.value;
    const commission = Math.round(price * Rate);
    const totalPrise = price - commission;
    const feeDisplay = document.getElementById("add-tax-price");
    const totalDisplay = document.getElementById("profit");
    feeDisplay.innerHTML = commission;
    totalDisplay.innerHTML = totalPrise;
  });
});