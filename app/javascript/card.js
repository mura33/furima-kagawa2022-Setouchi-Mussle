const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();

    // カード情報の取得先
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {  // カードオブジェクトを生成
      number: formData.get("number"),
      cvc: formData.get("cvc"),
      exp_month: formData.get("month"),
      exp_year: `20${formData.get("year")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");  //idを元に要素を取得
        const tokenObj = `<input value=${token} name='card_token' type="hidden">`;  //paramsの中にトークンを含める
        renderDom.insertAdjacentHTML("beforeend", tokenObj);  //フォームの一番最後に要素を追加
      }  
        document.getElementById("card-number").removeAttribute("name");
        document.getElementById("card-cvc").removeAttribute("name");
        document.getElementById("card-exp-month").removeAttribute("name");
        document.getElementById("card-exp-year").removeAttribute("name");

        document.getElementById("charge-form").submit();

        console.log();
    });
  });
};
window.addEventListener("load", pay);