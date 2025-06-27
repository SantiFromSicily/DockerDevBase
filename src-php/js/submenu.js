document.addEventListener('DOMContentLoaded', () => {
  const submenuParents = document.querySelectorAll('.main-nav .has-submenu');

  let openSubmenu = null;
  let openToggle = null;

  submenuParents.forEach(parent => {
    const toggle = parent.querySelector('.nav-link.has-arrow');
    const submenu = parent.querySelector('.submenu');

    if (!toggle || !submenu) return;

    let overLink = false;
    let overSubmenu = false;

    const closeSubmenu = () => {
      if (openSubmenu) {
        openSubmenu.classList.remove('open');
        if (openToggle) {
          openToggle.classList.remove('active');
          openToggle.blur();
        }
        openSubmenu = null;
        openToggle = null;
      }
    };

    const tryClose = () => {
      setTimeout(() => {
        if (!overLink && !overSubmenu) {
          closeSubmenu();
        }
      }, 150);
    };

    toggle.addEventListener('click', (e) => {
      e.preventDefault();
      e.stopPropagation();

      if (submenu.classList.contains('open')) {
        closeSubmenu();
      } else {
        document.querySelectorAll('.main-nav .submenu.open').forEach(el => el.classList.remove('open'));
        document.querySelectorAll('.main-nav .nav-link.has-arrow.active').forEach(el => el.classList.remove('active'));

        submenu.classList.add('open');
        toggle.classList.add('active');
        toggle.blur();

        openSubmenu = submenu;
        openToggle = toggle;
      }
    });

    toggle.addEventListener('mouseenter', () => {
      overLink = true;
    });

    toggle.addEventListener('mouseleave', () => {
      overLink = false;
      tryClose();
    });

    submenu.addEventListener('mouseenter', () => {
      overSubmenu = true;
      // ✅ Riattiva visivamente il link se entri nel submenu
      if (openToggle && !openToggle.classList.contains('active')) {
        openToggle.classList.add('active');
      }
    });

    submenu.addEventListener('mouseleave', () => {
      overSubmenu = false;
      tryClose();
    });
  });

  // ❌ NON azzerare openToggle/openSubmenu qui!
  document.addEventListener('click', (e) => {
    submenuParents.forEach(parent => {
      if (!parent.contains(e.target)) {
        const submenu = parent.querySelector('.submenu');
        const toggle = parent.querySelector('.nav-link.has-arrow');
        submenu?.classList.remove('open');
        toggle?.classList.remove('active');
        toggle?.blur();
      }
    });
    // <-- NON azzerare qui: lasciamo che submenu mouseenter funzioni!
    // openSubmenu = null;
    // openToggle = null;
  });
});
