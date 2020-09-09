window.onload = (event) => {

  let description = document.createElement("meta");
  description.name = "description";
  description.content = "Medical equipment in the fields of Corona Virus, Oncology and Psychiatry";
  document.head.append(description);

  let keywords = document.createElement("meta");
  keywords.name = "keywords";
  keywords.content = "Medical equipment, Corona, Oncology, Psychiatry";
  document.head.append(keywords);

  let author = document.createElement("meta");
  author.name = "author";
  author.content = "Yonatan Jenudi, Elad Gashri, Eli Rozner";
  document.head.append(author);

  let fav = document.createElement("link");
  fav.rel = "icon";
  fav.type = "image/x-icon";
  fav.href = "../favicon.ico";
  document.head.append(fav);
  document.querySelector("title").id = "t";
  document.getElementById("t").innerText = "Med-Equipment";

  let css = document.createElement("link");
  css.rel = "stylesheet";
  css.type = "text/css";
  css.href = "../css/styles.css";
  document.head.append(css);

  let hed = document.createElement("header");
  hed.id = "hed";
  document.body.append(hed);

  let header_t = document.createElement("a");
  header_t.class = "top";
  header_t.href = "../intro.html";
  header_t.textContent = "Med-Equipment.";
  document.getElementById("hed").append(header_t);

  let na = document.createElement("nav");
  na.id = "nav";
  document.body.append(na);

  let intro_na = document.createElement("a");
  intro_na.id = "intro_na";
  intro_na.href = "../intro.html";
  intro_na.innerText = "HOME";
  document.getElementById("nav").append(intro_na);

  let al_pro_na = document.createElement("a");
  al_pro_na.id = "al_pro_na";
  al_pro_na.href = "allpro.html";
  al_pro_na.innerText = "ALL PRODUCTS";
  document.getElementById("nav").append(al_pro_na);

  let cor_na = document.createElement("a");
  cor_na.id = "cor_na";
  cor_na.href = "corona.html";
  cor_na.innerText = "CORONA";
  document.getElementById("nav").append(cor_na);

  let psy_na = document.createElement("a");
  psy_na.id = "psy_na";
  psy_na.href = "psy.html";
  psy_na.innerText = "PSYCHIATRY";
  document.getElementById("nav").append(psy_na);

  let onco_na = document.createElement("a");
  onco_na.id = "onco_na";
  onco_na.href = "onco.html";
  onco_na.innerText = "ONCOLOGY";
  document.getElementById("nav").append(onco_na);

  let sale_na = document.createElement("a");
  sale_na.id = "sale_na";
  sale_na.href = "sale.html";
  sale_na.innerText = "SALE";
  document.getElementById("nav").append(sale_na);

  let user_na = document.createElement("a");
  user_na.id = "user_na";
  user_na.href = "user.html";
  user_na.innerText = "user";
  document.getElementById("nav").append(user_na);

};
