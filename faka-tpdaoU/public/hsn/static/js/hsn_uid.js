document.addEventListener('DOMContentLoaded', function () {
    const CookieUtil = {
        set(value) {
            const domain = '.' + window.location.host.split('.').slice(-2).join('.');
            document.cookie = `tgName=${value}; path=/; domain=${domain}`;
        },

        get() {
            const match = document.cookie.match('(^|;)\\s*tgName\\s*=\\s*([^;]+)');
            return match ? match.pop() : null;
        },
    };

    function getUidFromUrl() {
        const search = window.location.search;
        if (search && search.startsWith('?')) {
            const tgName = search.substring(1);
            CookieUtil.set(tgName);
            localStorage.setItem('uid', tgName);  
            return tgName;
        }

        const storedTgName = CookieUtil.get();
        if (storedTgName) {
            localStorage.setItem('uid', storedTgName);
            return storedTgName;
        }

        const localUid = localStorage.getItem('uid');
        if (localUid) {
            CookieUtil.set(localUid);  
            return localUid;
        }

        return '';
    }

    function appendUidToUrl(url) {
        const uid = getUidFromUrl();
        if (!uid) return url;

        try {
            if (!url.startsWith('/') && !url.startsWith('http')) {
                url = '/hsn/' + url;
            }

            if (url.startsWith('http')) {
                const urlObj = new URL(url);
                const baseUrl = urlObj.origin + urlObj.pathname;
                const hash = urlObj.hash;
                return `${baseUrl}?${uid}${hash}`;
            } else {
                const path = url.startsWith('/hsn/') ? url : '/hsn' + (url.startsWith('/') ? url : '/' + url);
                return `${path}?${uid}`;
            }
        } catch (e) {
            return url;
        }
    }

    function handleInternalLinks() {
        const uid = getUidFromUrl();
        if (!uid) return;

        document.querySelectorAll('a').forEach(link => {
            const href = link.getAttribute('href');
            if (!href) return;

            if (href.startsWith('javascript:') || href === '#') return;
            if (href.startsWith('https://t.me/')) return;
            if (href.startsWith('http') && !href.includes(window.location.hostname)) return;

            const newHref = appendUidToUrl(href);
            link.setAttribute('href', newHref);
        });
    }

    function setupLinkObserver() {
        const observer = new MutationObserver(function(mutations) {
            mutations.forEach(function(mutation) {
                if (mutation.addedNodes.length) {
                    handleInternalLinks();
                }
            });
        });

        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    }

    function checkBeforeLoad() {
        const search = window.location.search;
        if (search && search.startsWith('?')) {
            const tgName = search.substring(1);
            CookieUtil.set(tgName);
            localStorage.setItem('uid', tgName);
        } else {
            const savedTgName = getUidFromUrl();
            if (savedTgName) {
                const currentUrl = window.location.href;
                const hashIndex = currentUrl.indexOf('#');
                const baseUrl = hashIndex !== -1 ? currentUrl.substring(0, hashIndex) : currentUrl;
                const hash = hashIndex !== -1 ? currentUrl.substring(hashIndex) : '';
                const newUrl = `${baseUrl.split('?')[0]}?${savedTgName}${hash}`;
                
                if (newUrl !== currentUrl) {
                    window.location.replace(newUrl);
                }
            }
        }
    }

    window.getUidFromUrl = getUidFromUrl;
    window.appendUidToUrl = appendUidToUrl;

    function initializeApp() {
        checkBeforeLoad();
        handleInternalLinks();
        setupLinkObserver();
    }

    window.addEventListener('popstate', function() {
        const savedTgName = getUidFromUrl();
        if (savedTgName && !window.location.search) {
            const newUrl = appendUidToUrl(window.location.href);
            if (newUrl !== window.location.href) {
                window.location.replace(newUrl);
            }
        }
    });

    initializeApp();
});