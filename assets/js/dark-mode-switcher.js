// dark-mode-switcher.js

document.addEventListener('DOMContentLoaded', () => {
    const toggleButton = document.getElementById('dark-mode-toggle');
    const body = document.body;
    const iconSpan = toggleButton.querySelector('.icon');
    const DARK_MODE_KEY = 'darkModeManual';

    // Function to set the mode and update the button/storage
    function setDarkMode(isDark) {
        if (isDark) {
            body.classList.add('dark-mode');
            iconSpan.classList.remove('fa-moon');
            iconSpan.classList.add('fa-sun');
            toggleButton.title = "Toggle Light Mode";
            localStorage.setItem(DARK_MODE_KEY, 'dark');
        } else {
            body.classList.remove('dark-mode');
            iconSpan.classList.remove('fa-sun');
            iconSpan.classList.add('fa-moon');
            toggleButton.title = "Toggle Dark Mode";
            localStorage.setItem(DARK_MODE_KEY, 'light');
        }
    }

    // --- Initial Load Logic ---
    const savedMode = localStorage.getItem(DARK_MODE_KEY);
    const prefersDark = window.matchMedia && window.matchMedia('(prefers-color-scheme: dark)').matches;

    if (savedMode) {
        // Apply saved mode (user's manual choice)
        setDarkMode(savedMode === 'dark');
    } else if (prefersDark) {
        // Apply system preference if no manual choice exists
        setDarkMode(true);
    } else {
        // Default to light mode
        setDarkMode(false);
    }
    // --- End Initial Load Logic ---

    // Toggle click handler
    toggleButton.addEventListener('click', () => {
        const isCurrentlyDark = body.classList.contains('dark-mode');
        setDarkMode(!isCurrentlyDark);
    });
});