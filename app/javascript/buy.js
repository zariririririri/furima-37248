const pay = () => {
  console.log("カード情報トークン化のためのJavaScript");
};
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
    

    const buy = {
      number: formData.get("buy_receiver[number]"),
      cvc: formData.get("buy_receiver[cvc]"),
      exp_month: formData.get("buy_receiver[exp_month]"),
      exp_year: `20${formData.get("buy_receiver[exp_year]")}`,
    };

    Payjp.createToken(buy, (status, response) => {
      console.log(response);
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

document.getElementById("buy_receiver").removeAttribute("name");
      document.getElementById("buy-cvc").removeAttribute("name");
      document.getElementById("buy-exp-month").removeAttribute("name");
      document.getElementById("buy-exp-year").removeAttribute("name");
    
      // document.getElementById("charge-form").submit(); 
    });
  });
};



window.addEventListener("load", pay);