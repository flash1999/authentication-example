document.addEventListener('DOMContentLoaded', function () {
  const loginButton = document.querySelector('.login-button');

  if (loginButton) {
    loginButton.classList.add('ripple');

    loginButton.addEventListener('click', function (event) {
      const x = event.clientX - loginButton.offsetLeft;
      const y = event.clientY - loginButton.offsetTop;

      const ripple = document.createElement('span');
      ripple.style.left = `${x}px`;
      ripple.style.top = `${y}px`;
      ripple.classList.add('ripple-effect');

      this.appendChild(ripple);

      setTimeout(() => {
        ripple.remove();
      }, 600);
    });
  }
});
