// Progressive enhancement only: every piece of content is real HTML first.
// Nothing here is required to read, crawl or use the site.

const reduce = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
const finePointer = window.matchMedia('(hover: hover) and (pointer: fine)').matches;
const clamp = (v: number, a = 0, b = 1) => Math.min(b, Math.max(a, v));

// ---------- scroll progress + nav state ----------
const bar = document.getElementById('scroll-progress');
const nav = document.getElementById('site-nav');
let ticking = false;
function onScroll() {
  const max = document.documentElement.scrollHeight - innerHeight;
  if (bar) bar.style.transform = `scaleX(${max > 0 ? clamp(scrollY / max) : 0})`;
  nav?.classList.toggle('scrolled', scrollY > 8);
  updateTimeline();
  ticking = false;
}
addEventListener('scroll', () => { if (!ticking) { ticking = true; requestAnimationFrame(onScroll); } }, { passive: true });

// ---------- staggered reveal ----------
document.querySelectorAll<HTMLElement>('.fade-in').forEach((el) => {
  const sibs = el.parentElement ? [...el.parentElement.children].filter((c) => c.classList.contains('fade-in')) : [];
  const i = Math.max(0, sibs.indexOf(el));
  if (i > 0) el.style.transitionDelay = `${Math.min(i, 8) * 70}ms`;
});

// ---------- cursor glow + card spotlight + tilt (fine pointers only) ----------
if (finePointer && !reduce) {
  const glow = document.createElement('div');
  glow.className = 'cursor-glow';
  document.body.prepend(glow);
  addEventListener('pointermove', (e) => {
    glow.style.setProperty('--cx', e.clientX + 'px');
    glow.style.setProperty('--cy', e.clientY + 'px');
    glow.classList.add('on');
  }, { passive: true });
  document.addEventListener('pointerleave', () => glow.classList.remove('on'));

  document.querySelectorAll<HTMLElement>('.card, .work-card, .project-card, .post-card').forEach((card) => {
    const tilt = card.matches('.work-card, .project-card');
    card.addEventListener('pointermove', (e) => {
      const r = card.getBoundingClientRect();
      const x = e.clientX - r.left, y = e.clientY - r.top;
      card.style.setProperty('--mx', x + 'px');
      card.style.setProperty('--my', y + 'px');
      if (tilt) {
        card.style.setProperty('--ry', ((x / r.width - 0.5) * 7).toFixed(2) + 'deg');
        card.style.setProperty('--rx', ((0.5 - y / r.height) * 7).toFixed(2) + 'deg');
      }
    });
    card.addEventListener('pointerleave', () => {
      card.style.setProperty('--rx', '0deg');
      card.style.setProperty('--ry', '0deg');
    });
  });

  // magnetic buttons
  document.querySelectorAll<HTMLElement>('.btn').forEach((btn) => {
    btn.addEventListener('pointermove', (e) => {
      const r = btn.getBoundingClientRect();
      btn.style.setProperty('--tx', ((e.clientX - r.left - r.width / 2) * 0.18).toFixed(1) + 'px');
      btn.style.setProperty('--ty', ((e.clientY - r.top - r.height / 2) * 0.28).toFixed(1) + 'px');
    });
    btn.addEventListener('pointerleave', () => {
      btn.style.setProperty('--tx', '0px');
      btn.style.setProperty('--ty', '0px');
    });
  });

  // hero depth parallax
  const hero = document.querySelector<HTMLElement>('.hero');
  const visual = document.querySelector<HTMLElement>('.hero-visual');
  if (hero && visual) {
    hero.addEventListener('pointermove', (e) => {
      const r = hero.getBoundingClientRect();
      visual.style.setProperty('--px', (((e.clientX - r.left) / r.width - 0.5) * 2).toFixed(3));
      visual.style.setProperty('--py', (((e.clientY - r.top) / r.height - 0.5) * 2).toFixed(3));
    });
  }
}

// ---------- count-up stats ----------
document.querySelectorAll<HTMLElement>('[data-count]').forEach((el) => {
  const final = el.textContent ?? '';
  const m = final.match(/^(\d+)(.*)$/);
  if (!m || reduce) return;
  const target = parseInt(m[1], 10), suffix = m[2];
  const io = new IntersectionObserver((entries) => {
    if (!entries[0].isIntersecting) return;
    io.disconnect();
    const t0 = performance.now(), dur = 1400;
    const step = (t: number) => {
      const p = clamp((t - t0) / dur);
      const eased = 1 - Math.pow(1 - p, 4);
      el.textContent = Math.round(target * eased) + suffix;
      if (p < 1) requestAnimationFrame(step); else el.textContent = final;
    };
    requestAnimationFrame(step);
  }, { threshold: 0.6 });
  io.observe(el);
});

// ---------- scroll-linked process timeline ----------
const timeline = document.querySelector<HTMLElement>('.timeline');
function updateTimeline() {
  if (!timeline) return;
  const r = timeline.getBoundingClientRect();
  const mid = innerHeight * 0.55;
  const p = clamp((mid - r.top) / r.height);
  timeline.style.setProperty('--p', p.toFixed(4));
  timeline.querySelectorAll<HTMLElement>('.step').forEach((s) => {
    const n = s.querySelector('.node')!.getBoundingClientRect();
    s.classList.toggle('active', n.top + n.height / 2 < mid);
  });
}

// ---------- scroll-spy for in-page nav ----------
const links = [...document.querySelectorAll<HTMLAnchorElement>('#nav-links a[href^="/#"], #nav-links a[href^="#"]')]
  .filter((a) => document.getElementById(a.getAttribute('href')!.replace(/^\/?#/, '')));
if (links.length) {
  const map = new Map(links.map((a) => [a.getAttribute('href')!.replace(/^\/?#/, ''), a]));
  const spy = new IntersectionObserver((entries) => {
    entries.forEach((en) => {
      if (en.isIntersecting) {
        links.forEach((l) => l.classList.remove('active'));
        map.get(en.target.id)?.classList.add('active');
      }
    });
  }, { rootMargin: '-45% 0px -50% 0px' });
  map.forEach((_, id) => { const s = document.getElementById(id); if (s) spy.observe(s); });
}

// ---------- services category filter ----------
document.querySelectorAll<HTMLElement>('[data-filter-group]').forEach((group) => {
  const buttons = [...group.querySelectorAll<HTMLButtonElement>('[data-filter]')];
  const targets = [...document.querySelectorAll<HTMLElement>(group.dataset.filterGroup!)];
  buttons.forEach((b) => b.addEventListener('click', () => {
    const key = b.dataset.filter!;
    buttons.forEach((x) => x.setAttribute('aria-pressed', String(x === b)));
    targets.forEach((t) => {
      const show = key === 'all' || t.dataset.cat === key;
      t.hidden = !show;
      if (show && !reduce) t.animate([{ opacity: 0, transform: 'scale(.96)' }, { opacity: 1, transform: 'none' }], { duration: 380, easing: 'cubic-bezier(.22,1,.36,1)' });
    });
  }));
});

onScroll();
