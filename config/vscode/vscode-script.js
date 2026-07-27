document.addEventListener('DOMContentLoaded', function () {
    const POLL_INTERVAL_MS = 500;

    function toggleStickyWidgets(visible) {
        const opacity = visible ? 1 : 0;

        document.querySelectorAll('.sticky-widget').forEach((widget) => {
            widget.style.opacity = opacity;
        });

        const treeWidget = document.querySelector('.monaco-tree-sticky-container');
        if (treeWidget) treeWidget.style.opacity = opacity;
    }

    function showBlur() {
        const targetDiv = document.querySelector('.monaco-workbench');
        if (!targetDiv) return;

        // Avoid stacking multiple blur overlays
        document.getElementById('command-blur')?.remove();

        const blurEl = document.createElement('div');
        blurEl.id = 'command-blur';
        blurEl.addEventListener('click', () => blurEl.remove());
        targetDiv.appendChild(blurEl);

        toggleStickyWidgets(false);
    }

    function hideBlur() {
        document.getElementById('command-blur')?.click();
        toggleStickyWidgets(true);
    }

    // Wait for the command palette element to exist in the DOM, then watch
    // its `style` attribute to know when it opens/closes.
    const waitForPalette = setInterval(() => {
        const commandDialog = document.querySelector('.quick-input-widget');
        if (!commandDialog) return;

        clearInterval(waitForPalette);

        const observer = new MutationObserver((mutations) => {
            for (const mutation of mutations) {
                if (mutation.type === 'attributes' && mutation.attributeName === 'style') {
                    if (commandDialog.style.display === 'none') {
                        hideBlur();
                    } else {
                        showBlur();
                    }
                }
            }
        });
        observer.observe(commandDialog, { attributes: true });
    }, POLL_INTERVAL_MS);

    document.addEventListener(
        'keydown',
        (event) => {
            if ((event.metaKey || event.ctrlKey) && event.key === 'p') {
                event.preventDefault();
                showBlur();
            } else if (event.key === 'Escape') {
                event.preventDefault();
                hideBlur();
            }
        },
        true
    );
});
