<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>NexusShop — Modern Store</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@600;700;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

  <style>
    :root{
      --bg:#f7f8fc;--surface:#fff;--text:#172033;--muted:#697386;--primary:#5b4bff;
      --primary-dark:#4638dc;--accent:#ff5c8a;--success:#16a673;--border:#e8eaf0;
      --shadow:0 10px 35px rgba(23,32,51,.08);--radius:18px;--container:1240px
    }
    *{box-sizing:border-box}
    html{scroll-behavior:smooth}
    body{margin:0;font-family:Inter,system-ui,sans-serif;color:var(--text);background:var(--bg);line-height:1.5}
    a{text-decoration:none;color:inherit} button,input{font:inherit}
    .container{width:min(var(--container),calc(100% - 32px));margin:auto}
    header{position:sticky;top:0;z-index:50;background:rgba(255,255,255,.9);backdrop-filter:blur(16px);border-bottom:1px solid var(--border)}
    .header-inner{height:76px;display:flex;align-items:center;gap:24px}
    .brand{font-family:Poppins;font-size:23px;font-weight:800;white-space:nowrap}
    .brand span{color:var(--primary)}
    nav ul{display:flex;gap:6px;list-style:none;margin:0;padding:0}
    nav a{display:flex;gap:8px;align-items:center;padding:10px 12px;border-radius:10px;color:#4c566a;font-weight:600}
    nav a:hover,nav a.active{background:#f0efff;color:var(--primary)}
    .search{margin-left:auto;display:flex;align-items:center;width:min(330px,30vw);height:44px;background:#f3f4f8;border:1px solid transparent;border-radius:12px;padding:0 12px;gap:9px}
    .search:focus-within{background:#fff;border-color:#cfcaff;box-shadow:0 0 0 4px #eeecff}
    .search input{border:0;outline:0;background:transparent;width:100%;color:var(--text)}
    .icon-btn,.cart-btn{border:0;background:transparent;cursor:pointer;color:#465064;display:grid;place-items:center}
    .header-actions{display:flex;gap:8px;align-items:center}
    .round-btn{width:42px;height:42px;border-radius:12px;background:#fff;border:1px solid var(--border)}
    .round-btn:hover{color:var(--primary);border-color:#cfcaff}
    .cart-btn{position:relative}
    .cart-count{position:absolute;right:-3px;top:-4px;background:var(--accent);color:#fff;font-size:10px;font-weight:800;min-width:19px;height:19px;border-radius:50%;display:grid;place-items:center;border:2px solid #fff}
    .mobile-toggle{display:none;border:0;background:transparent;font-size:20px}

    .hero{margin:24px auto 0;min-height:450px;border-radius:28px;overflow:hidden;display:flex;align-items:center;
      background:linear-gradient(90deg,rgba(18,24,48,.94) 0%,rgba(18,24,48,.76) 48%,rgba(18,24,48,.18) 100%),
      url('https://images.unsplash.com/photo-1555529669-e69e7aa0ba9a?auto=format&fit=crop&w=1600&q=85') center/cover}
    .hero-content{max-width:650px;padding:72px;color:#fff}
    .eyebrow{display:inline-flex;gap:8px;align-items:center;background:rgba(255,255,255,.12);border:1px solid rgba(255,255,255,.2);padding:8px 12px;border-radius:999px;font-size:13px;font-weight:700}
    .hero h1{font-family:Poppins;font-size:clamp(38px,5vw,62px);line-height:1.05;margin:18px 0}
    .hero p{font-size:17px;color:#e4e7f0;max-width:570px}
    .hero-actions{display:flex;gap:12px;flex-wrap:wrap;margin-top:28px}
    .btn{border:0;border-radius:12px;padding:12px 19px;display:inline-flex;align-items:center;justify-content:center;gap:9px;font-weight:700;cursor:pointer;transition:.2s}
    .btn-primary{background:var(--primary);color:#fff}.btn-primary:hover{background:var(--primary-dark);transform:translateY(-1px)}
    .hero .btn-primary{background:#fff;color:#3026bd}
    .btn-secondary{background:rgba(255,255,255,.1);color:#fff;border:1px solid rgba(255,255,255,.3)}
    .section{padding:64px 0 0}
    .section-head{display:flex;align-items:end;justify-content:space-between;gap:16px;margin-bottom:22px}
    .section-head h2{font-family:Poppins;font-size:28px;margin:0}.section-head p{margin:5px 0 0;color:var(--muted)}
    .view-all{color:var(--primary);font-weight:700;font-size:14px}

    .categories{display:grid;grid-template-columns:repeat(6,1fr);gap:14px}
    .cat-card{background:var(--surface);border:1px solid var(--border);border-radius:16px;padding:22px 12px;text-align:center;cursor:pointer;transition:.2s}
    .cat-card:hover{transform:translateY(-4px);box-shadow:var(--shadow);border-color:#d5d1ff}
    .cat-icon{width:52px;height:52px;margin:0 auto 12px;border-radius:15px;background:#f0efff;color:var(--primary);display:grid;place-items:center;font-size:21px}
    .cat-card h4{margin:0;font-size:14px}.cat-card small{color:var(--muted);display:block;margin-top:4px}

    .toolbar{display:flex;justify-content:space-between;align-items:center;margin-bottom:18px;gap:12px}
    .filter-pills{display:flex;gap:8px;flex-wrap:wrap}
    .pill{border:1px solid var(--border);background:#fff;color:#5d6678;border-radius:999px;padding:8px 13px;cursor:pointer;font-size:13px;font-weight:600}
    .pill.active,.pill:hover{background:#eeecff;border-color:#d5d1ff;color:var(--primary)}
    .products{display:grid;grid-template-columns:repeat(4,1fr);gap:18px}
    .product{background:#fff;border:1px solid var(--border);border-radius:18px;overflow:hidden;position:relative;transition:.22s}
    .product:hover{transform:translateY(-5px);box-shadow:var(--shadow)}
    .product-media{position:relative;background:#f4f5f8}
    .product-media img{width:100%;height:235px;object-fit:cover;display:block}
    .badge{position:absolute;left:12px;top:12px;background:var(--primary);color:#fff;padding:6px 9px;border-radius:8px;font-size:11px;font-weight:800}
    .wish{position:absolute;right:12px;top:12px;width:36px;height:36px;border:0;border-radius:10px;background:rgba(255,255,255,.94);cursor:pointer;color:#5b6475}
    .wish.active{color:#ff4d7d}
    .product-body{padding:16px}
    .category-label{color:var(--muted);font-size:12px;text-transform:uppercase;letter-spacing:.05em}
    .product h3{font-size:15px;margin:6px 0 12px}
    .price-row{display:flex;justify-content:space-between;align-items:center;gap:10px}
    .price{font-size:18px;font-weight:800}.old-price{font-size:12px;color:#9aa1af;text-decoration:line-through;margin-left:5px}
    .rating{font-size:12px;color:#f6ae2d}.rating span{color:var(--muted)}
    .product-footer{padding:0 16px 16px;display:flex;gap:8px}
    .add-btn{flex:1;border:0;border-radius:11px;background:#181f32;color:#fff;padding:11px;font-weight:700;cursor:pointer}
    .add-btn:hover{background:var(--primary)}

    .deal{margin-top:18px;border-radius:24px;overflow:hidden;background:#151b2e;color:#fff;display:grid;grid-template-columns:1fr 1fr}
    .deal img{width:100%;height:100%;min-height:330px;object-fit:cover}
    .deal-content{padding:45px;display:flex;flex-direction:column;justify-content:center}
    .deal-tag{color:#ff8eae;font-weight:800;font-size:13px;text-transform:uppercase;letter-spacing:.08em}
    .deal h2{font-family:Poppins;font-size:34px;margin:8px 0}.deal p{color:#c6ccda}
    .timer{display:flex;gap:9px;margin:20px 0}.time-box{background:#252d45;border:1px solid #343d58;border-radius:12px;min-width:68px;text-align:center;padding:10px}
    .time-box strong{display:block;font-size:20px}.time-box small{color:#aeb6c8}
    .deal-price{font-size:27px;font-weight:800}.deal-price s{font-size:15px;color:#8f98aa;margin-left:8px}

    .reviews{display:grid;grid-template-columns:repeat(3,1fr);gap:16px}
    .review{background:#fff;border:1px solid var(--border);border-radius:18px;padding:22px}
    .review .stars{color:#f6ae2d}.review p{color:#555f72;min-height:72px}
    .review-user{display:flex;gap:10px;align-items:center}.review-user img{width:42px;height:42px;border-radius:50%;object-fit:cover}
    .review-user strong{display:block}.review-user small{color:var(--muted)}

    .newsletter{margin:64px 0 0;border-radius:24px;background:linear-gradient(135deg,#5b4bff,#7c62ff);padding:42px;text-align:center;color:#fff}
    .newsletter h2{font-family:Poppins;margin:0 0 8px}.newsletter p{color:#e6e4ff}
    .newsletter form{display:flex;justify-content:center;gap:8px;max-width:550px;margin:22px auto 0}
    .newsletter input{flex:1;border:0;outline:0;padding:13px 16px;border-radius:12px}
    .newsletter .btn{background:#fff;color:#4535df}

    footer{margin-top:55px;background:#12182a;color:#aeb6c8;padding:48px 0 25px}
    .footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:35px}
    footer h3,footer h4{color:#fff;margin-top:0}.footer-brand{font-family:Poppins;font-size:22px;font-weight:800}.footer-brand span{color:#8c7fff}
    footer a{display:block;margin:9px 0;font-size:14px}.socials{display:flex;gap:9px;margin-top:18px}.socials a{width:36px;height:36px;border:1px solid #30384d;border-radius:10px;display:grid;place-items:center}
    .copyright{border-top:1px solid #293148;margin-top:35px;padding-top:20px;text-align:center;font-size:13px}

    .empty{grid-column:1/-1;text-align:center;background:#fff;border:1px dashed #ccd1dc;padding:50px;border-radius:18px;color:var(--muted)}
    .toast{position:fixed;right:20px;bottom:20px;background:#171e31;color:#fff;padding:13px 17px;border-radius:12px;box-shadow:var(--shadow);transform:translateY(90px);opacity:0;transition:.25s;z-index:100}
    .toast.show{transform:translateY(0);opacity:1}

    @media(max-width:1050px){
      nav{display:none}.mobile-toggle{display:block}.search{width:min(360px,45vw)}
      .categories{grid-template-columns:repeat(3,1fr)}.products{grid-template-columns:repeat(3,1fr)}
      .reviews{grid-template-columns:1fr 1fr}.footer-grid{grid-template-columns:2fr 1fr 1fr}
    }
    @media(max-width:720px){
      .header-inner{height:68px;gap:10px}.brand{font-size:19px}.search{order:5;width:100%;display:none}.header-inner.search-open{flex-wrap:wrap;height:auto;padding:12px 0}.header-inner.search-open .search{display:flex}
      .hero{margin-top:14px;min-height:520px}.hero-content{padding:38px 25px}.hero h1{font-size:39px}
      .categories{grid-template-columns:repeat(2,1fr)}.products{grid-template-columns:1fr 1fr}.product-media img{height:190px}
      .deal{grid-template-columns:1fr}.deal img{min-height:230px;max-height:260px}.deal-content{padding:28px}
      .reviews{grid-template-columns:1fr}.newsletter{padding:30px 18px}.newsletter form{flex-direction:column}
      .footer-grid{grid-template-columns:1fr 1fr}
    }
    @media(max-width:480px){
      .container{width:min(var(--container),calc(100% - 22px))}.categories{gap:9px}.cat-card{padding:17px 8px}
      .products{gap:10px}.product-body{padding:12px}.product-footer{padding:0 12px 12px}.product-media img{height:165px}
      .product h3{font-size:13px}.price{font-size:15px}.rating{display:none}.hero h1{font-size:34px}
      .section{padding-top:48px}.footer-grid{grid-template-columns:1fr}
    }
  </style>
</head>

<body>
<header>
  <div class="container header-inner" id="headerInner">
    <button class="mobile-toggle" id="mobileToggle" aria-label="Open menu"><i class="fas fa-bars"></i></button>
    <a class="brand" href="#">Nexus<span>Shop</span></a>

    <nav aria-label="Primary navigation">
      <ul>
        <li><a class="active" href="#">Home</a></li>
        <li><a href="#categories">Categories</a></li>
        <li><a href="#products">Trending</a></li>
        <li><a href="#deals">Deals</a></li>
        <li><a href="#about">About</a></li>
      </ul>
    </nav>

    <div class="search" role="search">
      <i class="fas fa-search"></i>
      <input id="searchInput" type="search" placeholder="Search products..." aria-label="Search products">
    </div>

    <div class="header-actions">
      <button class="icon-btn round-btn" id="searchToggle" aria-label="Open search"><i class="fas fa-search"></i></button>
      <button class="icon-btn round-btn" aria-label="Account"><i class="far fa-user"></i></button>
      <button class="icon-btn round-btn" aria-label="Wishlist"><i class="far fa-heart"></i></button>
      <button class="icon-btn round-btn cart-btn" id="cartBtn" aria-label="Cart">
        <i class="fas fa-bag-shopping"></i><span class="cart-count" id="cartCount">0</span>
      </button>
    </div>
  </div>
  <div id="mobileMenu" style="display:none;background:#fff;border-top:1px solid var(--border)">
    <div class="container" style="padding:10px 0">
      <nav style="display:block"><ul style="display:flex;flex-direction:column;gap:3px">
        <li><a href="#">Home</a></li><li><a href="#categories">Categories</a></li><li><a href="#products">Trending</a></li><li><a href="#deals">Deals</a></li><li><a href="#about">About</a></li>
      </ul></nav>
    </div>
  </div>
</header>

<main>
  <section class="hero container">
    <div class="hero-content">
      <div class="eyebrow"><i class="fas fa-sparkles"></i> New season arrivals</div>
      <h1>Premium picks.<br>Better shopping.</h1>
      <p>Discover fashion, technology and everyday essentials curated for you — with simple shopping and limited-time offers.</p>
      <div class="hero-actions">
        <button class="btn btn-primary" id="shopNow">Shop now <i class="fas fa-arrow-right"></i></button>
        <button class="btn btn-secondary" id="exploreDeals">View deals</button>
      </div>
    </div>
  </section>

  <section class="section container" id="categories">
    <div class="section-head"><div><h2>Shop by category</h2><p>Find what you need faster.</p></div><a class="view-all" href="#products">View all <i class="fas fa-arrow-right"></i></a></div>
    <div class="categories" id="categoriesGrid"></div>
  </section>

  <section class="section container" id="products">
    <div class="section-head"><div><h2>Trending products</h2><p>Popular picks customers love right now.</p></div></div>
    <div class="toolbar">
      <div class="filter-pills" id="filterPills"></div>
      <span id="resultCount" class="muted" style="font-size:13px"></span>
    </div>
    <div class="products" id="productsGrid"></div>
  </section>

  <section class="section container" id="deals">
    <div class="section-head"><div><h2>Deal of the day</h2><p>Limited-time price on a customer favourite.</p></div></div>
    <div class="deal">
      <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1200&q=85" alt="MacBook Air">
      <div class="deal-content">
        <div class="deal-tag">Flash sale · 17% off</div>
        <h2>MacBook Air M2</h2>
        <p>Thin, light and powerful. Get premium performance at a special price while stock lasts.</p>
        <div class="timer">
          <div class="time-box"><strong id="dealDays">0</strong><small>Days</small></div>
          <div class="time-box"><strong id="dealHours">00</strong><small>Hours</small></div>
          <div class="time-box"><strong id="dealMinutes">00</strong><small>Min</small></div>
          <div class="time-box"><strong id="dealSeconds">00</strong><small>Sec</small></div>
        </div>
        <div class="deal-price">$999 <s>$1,199</s></div>
        <button class="btn btn-primary" id="buyDeal" style="margin-top:20px;width:max-content">Buy now <i class="fas fa-arrow-right"></i></button>
      </div>
    </div>
  </section>

  <section class="section container" id="about">
    <div class="section-head"><div><h2>What customers say</h2><p>Real feedback from shoppers.</p></div></div>
    <div class="reviews">
      <article class="review"><div class="stars">★★★★★</div><p>“Fast shipping and excellent customer support. The product exceeded my expectations!”</p><div class="review-user"><img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80" alt=""><div><strong>Ava Martin</strong><small>Verified buyer</small></div></div></article>
      <article class="review"><div class="stars">★★★★☆</div><p>“Great selection and the checkout was smooth. Will shop again.”</p><div class="review-user"><img src="https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80" alt=""><div><strong>Michael Lee</strong><small>Frequent buyer</small></div></div></article>
      <article class="review"><div class="stars">★★★★★</div><p>“The interface is easy to use and finding products is much faster than before.”</p><div class="review-user"><img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=80&q=80" alt=""><div><strong>Sophia Chen</strong><small>Verified buyer</small></div></div></article>
    </div>
  </section>

  <section class="container">
    <div class="newsletter">
      <h2>Get offers before everyone else</h2>
      <p>Subscribe for new arrivals, exclusive discounts and useful updates.</p>
      <form id="newsletterForm">
        <input id="newsletterEmail" type="email" placeholder="Enter your email" aria-label="Email address" required>
        <button class="btn" type="submit">Subscribe</button>
      </form>
      <div id="newsletterMsg" style="margin-top:12px;font-size:13px"></div>
    </div>
  </section>
</main>

<footer>
  <div class="container footer-grid">
    <div><div class="footer-brand">Nexus<span>Shop</span></div><p>Modern shopping made simple — discover products you love with less effort.</p>
      <div class="socials"><a href="#" aria-label="Facebook"><i class="fab fa-facebook"></i></a><a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a><a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a></div>
    </div>
    <div><h4>Shop</h4><a href="#categories">Categories</a><a href="#products">Trending</a><a href="#deals">Deals</a></div>
    <div><h4>Company</h4><a href="#about">About us</a><a href="#">Careers</a><a href="#">Press</a></div>
    <div><h4>Support</h4><a href="#">Help center</a><a href="#">Shipping & Returns</a><a href="#">Contact</a></div>
  </div>
  <div class="container copyright">© <span id="year"></span> NexusShop. All rights reserved.</div>
</footer>

<div class="toast" id="toast"></div>

<script>
const CATEGORIES=[
  {id:'phones',name:'Smartphones',icon:'fa-mobile-screen-button'},
  {id:'laptops',name:'Laptops',icon:'fa-laptop'},
  {id:'clothing',name:'Clothing',icon:'fa-shirt'},
  {id:'gadgets',name:'Gadgets',icon:'fa-headphones'},
  {id:'footwear',name:'Footwear',icon:'fa-shoe-prints'},
  {id:'accessories',name:'Accessories',icon:'fa-watch'}
];
const PRODUCTS=[
  {id:1,title:'iPhone 14 Pro Max',price:1099,oldPrice:1199,rating:5,reviews:128,badge:'New',img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80',category:'phones'},
  {id:2,title:'MacBook Pro 14"',price:1999,rating:4,reviews:86,img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80',category:'laptops'},
  {id:3,title:'Apple Watch Series 8',price:349,oldPrice:399,rating:5,reviews:214,badge:'-25%',img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80',category:'accessories'},
  {id:4,title:'Nike Air Max 270',price:150,rating:4,reviews:53,img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80',category:'footwear'},
  {id:5,title:'Sony A7 IV Camera',price:2499,rating:5,reviews:42,img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80',category:'gadgets'},
  {id:6,title:'Chanel No. 5',price:120,rating:5,reviews:189,img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80',category:'accessories'},
  {id:7,title:'Travel Backpack',price:79,oldPrice:99,rating:4,reviews:67,img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80',category:'accessories'},
  {id:8,title:'Sony WH-1000XM5',price:399,rating:5,reviews:156,img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80',category:'gadgets'}
];

const categoriesGrid=document.getElementById('categoriesGrid');
const productsGrid=document.getElementById('productsGrid');
const searchInput=document.getElementById('searchInput');
const cartCountEl=document.getElementById('cartCount');
const resultCount=document.getElementById('resultCount');
const filterPills=document.getElementById('filterPills');
let cartCount=0, activeCategory='all';

function escapeHtml(text){return String(text).replace(/[&<>"']/g,s=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[s]))}

function renderCategories(){
  categoriesGrid.innerHTML=CATEGORIES.map(c=>`
    <button class="cat-card" data-cat="${c.id}" aria-label="Browse ${escapeHtml(c.name)}">
      <div class="cat-icon"><i class="fas ${c.icon}"></i></div>
      <h4>${escapeHtml(c.name)}</h4><small>Explore now</small>
    </button>`).join('');
  categoriesGrid.querySelectorAll('.cat-card').forEach(el=>el.addEventListener('click',()=>{
    activeCategory=el.dataset.cat; renderFilters(); renderProducts(); document.getElementById('products').scrollIntoView({behavior:'smooth'});
  }));
}

function renderFilters(){
  filterPills.innerHTML=[{id:'all',name:'All products'},...CATEGORIES].map(c=>
    `<button class="pill ${activeCategory===c.id?'active':''}" data-cat="${c.id}">${c.name}</button>`).join('');
  filterPills.querySelectorAll('.pill').forEach(el=>el.addEventListener('click',()=>{
    activeCategory=el.dataset.cat; renderFilters(); renderProducts();
  }));
}

function renderProducts(){
  const q=searchInput.value.trim().toLowerCase();
  const list=PRODUCTS.filter(p=>(activeCategory==='all'||p.category===activeCategory)&&
    (!q||p.title.toLowerCase().includes(q)||p.category.toLowerCase().includes(q)));
  resultCount.textContent=`${list.length} product${list.length!==1?'s':''}`;
  if(!list.length){productsGrid.innerHTML='<div class="empty"><i class="fas fa-search" style="font-size:28px;margin-bottom:12px"></i><br>No products found.<br><small>Try another search or category.</small></div>';return}
  productsGrid.innerHTML=list.map(p=>`
    <article class="product">
      <div class="product-media">
        ${p.badge?`<span class="badge">${escapeHtml(p.badge)}</span>`:''}
        <button class="wish" data-wish="${p.id}" aria-label="Add ${escapeHtml(p.title)} to wishlist"><i class="far fa-heart"></i></button>
        <img src="${p.img}" alt="${escapeHtml(p.title)}" loading="lazy">
      </div>
      <div class="product-body">
        <div class="category-label">${escapeHtml(p.category)}</div>
        <h3>${escapeHtml(p.title)}</h3>
        <div class="price-row"><div><span class="price">$${p.price.toLocaleString()}</span>${p.oldPrice?`<span class="old-price">$${p.oldPrice.toLocaleString()}</span>`:''}</div>
        <div class="rating">${'★'.repeat(Math.round(p.rating))} <span>(${p.reviews})</span></div></div>
      </div>
      <div class="product-footer"><button class="add-btn" data-id="${p.id}"><i class="fas fa-bag-shopping"></i> Add to cart</button></div>
    </article>`).join('');
  productsGrid.querySelectorAll('.add-btn').forEach(btn=>btn.addEventListener('click',()=>addToCart(Number(btn.dataset.id))));
  productsGrid.querySelectorAll('.wish').forEach(btn=>btn.addEventListener('click',()=>{
    btn.classList.toggle('active');btn.innerHTML=btn.classList.contains('active')?'<i class="fas fa-heart"></i>':'<i class="far fa-heart"></i>';
    showToast(btn.classList.contains('active')?'Added to wishlist':'Removed from wishlist');
  }));
}

function addToCart(id){
  const p=PRODUCTS.find(x=>x.id===id);if(!p)return;
  cartCount++;cartCountEl.textContent=cartCount;showToast(`${p.title} added to cart`);
}
function showToast(message){const t=document.getElementById('toast');t.textContent=message;t.classList.add('show');clearTimeout(window.toastTimer);window.toastTimer=setTimeout(()=>t.classList.remove('show'),1800)}

searchInput.addEventListener('input',renderProducts);
document.getElementById('shopNow').onclick=()=>document.getElementById('products').scrollIntoView({behavior:'smooth'});
document.getElementById('exploreDeals').onclick=()=>document.getElementById('deals').scrollIntoView({behavior:'smooth'});
document.getElementById('buyDeal').onclick=()=>{cartCount++;cartCountEl.textContent=cartCount;showToast('MacBook Air M2 added to cart')};
document.getElementById('cartBtn').onclick=()=>showToast(cartCount?`You have ${cartCount} item${cartCount===1?'':'s'} in your cart`:'Your cart is empty');

document.getElementById('mobileToggle').onclick=()=>{
  const m=document.getElementById('mobileMenu');m.style.display=m.style.display==='block'?'none':'block';
};
document.getElementById('searchToggle').onclick=()=>{
  const h=document.getElementById('headerInner');h.classList.toggle('search-open');if(h.classList.contains('search-open'))searchInput.focus();
};

document.getElementById('newsletterForm').addEventListener('submit',e=>{
  e.preventDefault();const email=document.getElementById('newsletterEmail').value.trim();
  const msg=document.getElementById('newsletterMsg');
  if(!email||!email.includes('@')){msg.textContent='Please enter a valid email address.';return}
  msg.textContent='Thanks! You are subscribed.';document.getElementById('newsletterEmail').value='';
});

(function setupTimer(){
  const target=Date.now()+((24*60+36)*60*1000);
  const tick=()=>{
    const diff=Math.max(0,target-Date.now());
    document.getElementById('dealDays').textContent=Math.floor(diff/86400000);
    document.getElementById('dealHours').textContent=String(Math.floor(diff%86400000/3600000)).padStart(2,'0');
    document.getElementById('dealMinutes').textContent=String(Math.floor(diff%3600000/60000)).padStart(2,'0');
    document.getElementById('dealSeconds').textContent=String(Math.floor(diff%60000/1000)).padStart(2,'0');
  };tick();setInterval(tick,1000);
})();

document.getElementById('year').textContent=new Date().getFullYear();
renderCategories();renderFilters();renderProducts();
</script>
</body>
</html>
