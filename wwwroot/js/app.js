// Hero Slider
let currentSlide = 0;
const slides = document.querySelectorAll('.hero-slide');

function showSlide(index) {
    slides.forEach(slide => slide.classList.remove('active'));
    slides[index].classList.add('active');
}

function nextSlide() {
    currentSlide = (currentSlide + 1) % slides.length;
    showSlide(currentSlide);
}

setInterval(nextSlide, 5000);

// Navbar scroll effect
window.addEventListener('scroll', function() {
    const navbar = document.querySelector('.navbar');
    if (window.scrollY > 50) {
        navbar.style.background = 'rgba(0, 45, 77, 0.98)';
    } else {
        navbar.style.background = 'rgba(0, 45, 77, 0.95)';
    }
});

// Hamburger Menu Toggle - IMPROVED VERSION WITH DEBOUNCE
document.addEventListener('DOMContentLoaded', function() {
    const hamburger = document.getElementById('hamburger');
    const navMenu = document.getElementById('navMenu');
    
    if (!hamburger || !navMenu) {
        return; // Exit if elements don't exist
    }
    
    // Debounce flag to prevent rapid clicks
    let isAnimating = false;
    
    // Toggle menu function with debounce
    function toggleMenu(e) {
        e.stopPropagation(); // Prevent event bubbling
        
        // Prevent rapid clicking during animation
        if (isAnimating) return;
        
        isAnimating = true;
        
        hamburger.classList.toggle('active');
        navMenu.classList.toggle('open');
        
        // Reset debounce after animation completes
        setTimeout(() => {
            isAnimating = false;
        }, 400); // Match CSS transition duration
    }
    
    // Close menu function
    function closeMenu() {
        if (isAnimating) return;
        
        isAnimating = true;
        
        hamburger.classList.remove('active');
        navMenu.classList.remove('open');
        
        setTimeout(() => {
            isAnimating = false;
        }, 400);
    }
    
    // Hamburger click handler
    hamburger.addEventListener('click', toggleMenu);
    
    // Close menu when clicking on a link
    const navLinks = navMenu.querySelectorAll('a');
    navLinks.forEach(link => {
        link.addEventListener('click', closeMenu);
    });
    
    // Close menu when clicking outside
    document.addEventListener('click', function(event) {
        // Check if menu is open
        if (!navMenu.classList.contains('open')) {
            return;
        }
        
        // Check if click is outside both menu and hamburger
        if (!navMenu.contains(event.target) && !hamburger.contains(event.target)) {
            closeMenu();
        }
    });
    
    // Close menu on window resize to desktop size
    let resizeTimer;
    window.addEventListener('resize', function() {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(function() {
            if (window.innerWidth > 1024 && navMenu.classList.contains('open')) {
                closeMenu();
            }
        }, 250);
    });
    
    // Close menu on ESC key
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape' && navMenu.classList.contains('open')) {
            closeMenu();
        }
    });
    
    // Prevent body scroll when menu is open
    const observer = new MutationObserver(function(mutations) {
        mutations.forEach(function(mutation) {
            if (mutation.attributeName === 'class') {
                if (navMenu.classList.contains('open')) {
                    document.body.style.overflow = 'hidden';
                } else {
                    document.body.style.overflow = '';
                }
            }
        });
    });
    
    observer.observe(navMenu, { attributes: true });
});

// Set default opacity to 50% (0.5)
document.addEventListener('DOMContentLoaded', function() {
    // Set default overlay opacity to 50%
    document.documentElement.style.setProperty('--hero-overlay-opacity', 0.5);
});

/* OPACITY CONTROL PANEL - TEMPORARILY DISABLED
// Uncomment this section to enable opacity control panel

document.addEventListener('DOMContentLoaded', function() {
    // Create control panel
    const controlPanel = document.createElement('div');
    controlPanel.className = 'opacity-control-panel';
    controlPanel.innerHTML = `
        <div class="control-header">
            <span class="control-title">?? ?i?u Ch?nh ?? M? Banner</span>
            <button class="close-btn" id="closePanel">×</button>
        </div>
        <div class="slider-container">
            <div class="slider-label">
                <span>?? m? l?p ph?:</span>
                <span class="slider-value" id="opacityValue">50%</span>
            </div>
            <input type="range" min="0" max="100" value="50" class="opacity-slider" id="opacitySlider">
        </div>
        <div class="control-buttons">
            <button class="control-btn reset-btn" id="resetBtn">??t l?i</button>
            <button class="control-btn apply-btn" id="applyBtn">Áp d?ng</button>
        </div>
    `;
    document.body.appendChild(controlPanel);

    // Create toggle button
    const toggleBtn = document.createElement('button');
    toggleBtn.className = 'opacity-toggle-btn';
    toggleBtn.innerHTML = '?? ?i?u ch?nh ?? m?';
    toggleBtn.id = 'toggleOpacityPanel';
    document.body.appendChild(toggleBtn);

    // Elements
    const slider = document.getElementById('opacitySlider');
    const valueDisplay = document.getElementById('opacityValue');
    const resetBtn = document.getElementById('resetBtn');
    const applyBtn = document.getElementById('applyBtn');
    const closeBtn = document.getElementById('closePanel');
    const panel = controlPanel;
    const toggle = toggleBtn;

    // Load saved opacity
    const savedOpacity = localStorage.getItem('heroOverlayOpacity');
    if (savedOpacity) {
        const opacityPercent = parseFloat(savedOpacity) * 100;
        slider.value = opacityPercent;
        valueDisplay.textContent = Math.round(opacityPercent) + '%';
        document.documentElement.style.setProperty('--hero-overlay-opacity', savedOpacity);
    }

    // Update display when slider moves
    slider.addEventListener('input', function() {
        const value = this.value;
        valueDisplay.textContent = value + '%';
        const opacity = value / 100;
        document.documentElement.style.setProperty('--hero-overlay-opacity', opacity);
    });

    // Reset button
    resetBtn.addEventListener('click', function() {
        slider.value = 50;
        valueDisplay.textContent = '50%';
        document.documentElement.style.setProperty('--hero-overlay-opacity', 0.5);
    });

    // Apply button - save to localStorage
    applyBtn.addEventListener('click', function() {
        const opacity = slider.value / 100;
        localStorage.setItem('heroOverlayOpacity', opacity);
        
        // Show success message
        applyBtn.textContent = '? ?ã l?u!';
        applyBtn.style.background = '#28a745';
        
        setTimeout(() => {
            applyBtn.textContent = 'Áp d?ng';
            applyBtn.style.background = '';
        }, 2000);
    });

    // Close panel
    closeBtn.addEventListener('click', function() {
        panel.classList.add('hidden');
        toggle.classList.remove('hidden');
    });

    // Toggle panel
    toggle.addEventListener('click', function() {
        panel.classList.remove('hidden');
        toggle.classList.add('hidden');
    });

    // Start with panel visible
    panel.classList.remove('hidden');
    toggle.classList.add('hidden');
});

END OF OPACITY CONTROL PANEL */

// Language Switcher
document.addEventListener('DOMContentLoaded', function() {
    const langBtn = document.querySelector('.lang-btn');
    const langDropdown = document.querySelector('.language-dropdown');
    const currentLangSpan = document.querySelector('.current-lang');
    const langLinks = document.querySelectorAll('.lang-menu a');

    if (langBtn) {
        langBtn.addEventListener('click', function(e) {
            // Only for mobile or click interaction
            if (window.innerWidth <= 1024) {
                e.preventDefault();
                langDropdown.classList.toggle('active');
            }
        });
    }

    langLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const lang = this.getAttribute('data-lang');
            const text = this.textContent;
            
            // Update current language text
            if (currentLangSpan) {
                currentLangSpan.textContent = text;
            }
            
            // Close dropdown on mobile
            if (langDropdown) {
                langDropdown.classList.remove('active');
            }

            // Here you would add actual translation logic
            console.log('Switched to ' + lang);
        });
    });
});
