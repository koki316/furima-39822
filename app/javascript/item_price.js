const price = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;


  const addTaxDom = document.getElementById("add-tax-price");
  const taxValue = Math.floor(inputValue * 0.1);
  addTaxDom.innerHTML = taxValue.toString();

  const inProfit = document.getElementById("profit");
  const sumProfit = Math.floor(inputValue - taxValue);
  inProfit.innerHTML = sumProfit;

  });
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);