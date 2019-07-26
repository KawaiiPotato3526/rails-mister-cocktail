import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  console.log("helloooooo")
  new Typed('#banner-typed-text', {
    strings: ["Boba Shakalaka"],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
