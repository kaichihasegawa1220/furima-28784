window.addEventListener("DOMContentLoaded", () => {
const ProductPrice = document.getElementById("item-price")
const addTaxDom = document.getElementById("add-tax-price")
// add-tax-price
const profitDom = document.getElementById("profit")
// profit

ProductPrice.addEventListener("input",() => {
const InputValue = document.getElementById("item-price").value;
console.log(InputValue)
addTaxDom.innerHTML = Math.floor(InputValue * 0.1);
profitDom.innerHTML = Math.floor(InputValue * 0.9);

})
});


// 1.場所を全部確定される getelementbyid
// ２。価格だけ取得する value
// ３。計算式を書く valueに０.９をかけたり、０.１をかけたりする
// ４。結果を１で取得した要素に表示する innerHTML(処理の結果)


// 各要素の取得 getelementbyid
//   1item-id.value => 計算の元となる値の取得

//   2add-tax-price => 計算結果の手数料を返す場所の取得

//   3profit => 計算結果の販売利益を返すための場所の取得

// 計算の元となる取得した値を使って、計算を行う

// その結果を画面に返す
// innerHTML(処理の結果)

// console.log(input-price)