const toggleBtn = document.querySelector('.navbar__toogleBtn');
const menu = document.querySelector('.navbar__menu');
const submenu = document.querySelector('#submenu');

toggleBtn.addEventListener('click', () =>  {
    menu.classList.toggle('active');
});