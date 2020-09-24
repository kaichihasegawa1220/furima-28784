window.addEventListener("DOMContentLoaded", () => {
const ProductPrice = document.getElementById("item-price")
const addTaxDom = document.getElementById("add-tax-price")

const profitDom = document.getElementById("profit")

ProductPrice.addEventListener("input",() => {
const InputValue = document.getElementById("item-price").value;

addTaxDom.innerHTML = Math.floor(InputValue * 0.1);
profitDom.innerHTML = Math.floor(InputValue * 0.9);

})
});