// app/javascript/notification.js

document.addEventListener('turbo:load', () => {
  const notificationsDropdown = document.querySelector('.nav-item.dropdown');
  const notificationsTrigger = notificationsDropdown.querySelector('.nav-link.dropdown-toggle');

  notificationsTrigger.addEventListener('click', async (event) => {
    event.preventDefault();

    const response = await fetch('/notifications');
    if (response.ok) {
      const html = await response.text();
      document.querySelector('.dropdown-menu').innerHTML = html;
    } else {
      console.error('Failed to fetch notifications:', response.statusText);
    }
  });
});
