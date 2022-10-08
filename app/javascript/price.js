function calc (){
  const input_price = document.getElementById("item-price");
  // input.addEventListener("click", (e) => {
  //   e.preventDefault();
     input_price.addEventListener("input", () => {
     const price_date  = input_price.value
     const value = price_date * 0.1
     const add_tax_price = Math.floor(value)
     const value2 = price_date - add_tax_price
     const profit = Math.floor(value2)

     
     const input_add_tax_price = document.getElementById("add-tax-price");
     const input_profit = document.getElementById("profit");
     input_add_tax_price.innerHTML = add_tax_price
     input_profit.innerHTML = profit

 });
};

window.addEventListener('load', calc)
// 要素.addEventListener('イベント名', 関数)

