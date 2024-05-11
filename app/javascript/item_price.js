const priceInput = document.getElementById("item-price");
priceInput.addEventListener("input", () => {
  const inputValue = priceInput.value;

  const fee = inputValue * 0.1; //assuming the fee is 10% 
  const feeRoundedDown = Math.floor(fee);

  const addTaxDom = document.getElementById("add-tax-price");
  addTaxDom.innerHTML = feeRoundedDown;
})