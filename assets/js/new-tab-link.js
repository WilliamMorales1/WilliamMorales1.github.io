document.querySelectorAll('a').forEach(link => {
    // Check if the link is NOT inside the header section
    if (!link.closest('#header' || link.closest('#header#footer'))) {
        // Also ensure it's an actual external link (not a mailto or internal fragment)
        if (link.hostname && link.hostname !== location.hostname) {
            link.setAttribute('target', '_blank');
            link.setAttribute('rel', 'noopener noreferrer');
        }
    }
});